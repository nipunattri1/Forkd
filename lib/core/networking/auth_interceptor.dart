// ignore_for_file: unnecessary_ignore

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:forkd/core/services/forkd_token.dart';
import 'package:forkd/features/auth/data/datasource/forkd_accounts.dart';
import 'package:forkd/features/auth/domain/repositories/forkd_auth_repo.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this.accountsService,
    required this.tokenService,
    required this.authRepo,
    required this.dio,
  });

  final ForkdAccountsDataSource accountsService;
  final ForkdTokenService tokenService;
  final ForkdAuthRepo authRepo;
  final Dio dio;

  DateTime? _rateLimitReset;

  final Map<String, Completer<bool>> _platformRefreshCompleters = {};

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_rateLimitReset != null) {
      final delay = _rateLimitReset!.difference(DateTime.now().toUtc());
      if (delay.inSeconds > 0) {
        if (kDebugMode) {
          print(
            'Delaying request: ${delay.inSeconds}s',
          ); // ignore: document_ignores
        }
        // ignore: inference_failure_on_instance_creation
        await Future.delayed(delay);
      } else {
        _rateLimitReset = null;
      }
    }

    final account = await accountsService.getActiveAccount;
    if (account == null) return super.onRequest(options, handler);

    final pendingRefresh = _platformRefreshCompleters[account.tokenHash];
    if (pendingRefresh != null) {
      if (kDebugMode) {
        print(
          'Holding request — ${account.platform} refresh in progress: ${options.uri}',
        );
      }
      final success = await pendingRefresh.future;
      if (!success) {
        return handler.reject(
          DioException(
            requestOptions: options,
            error: 'Authentication refresh failed for queued request.',
          ),
        );
      }
    }

    final token = await tokenService.getAccessToken(account.tokenHash);
    token.fold(
      (_) => null,
      (accessToken) => options.headers[HttpHeaders.authorizationHeader] =
          'Bearer $accessToken',
    );

    if (kDebugMode) {
      print('[Request] ${options.uri}');
      print('[Body]    ${options.data}');
    }

    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;

    if (statusCode == 401) {
      final account = await authRepo.getActiveAccount;
      final isLoggedIn = await authRepo.isLoggedIn;

      if (account == null || !isLoggedIn) return handler.next(err);

      final uuid = account.tokenHash;
      final pendingRefresh = _platformRefreshCompleters[uuid];

      if (pendingRefresh != null) {
        if (kDebugMode) {
          print(
            'Queuing 401 retry — $uuid refresh in progress: ${err.requestOptions.uri}',
          );
        }

        final refreshSucceeded = await pendingRefresh.future;
        if (!refreshSucceeded) return handler.next(err);

        return _attachTokenAndRetry(uuid, err, handler);
      }

      final completer = Completer<bool>();

      _platformRefreshCompleters[uuid] = completer;
      tokenService.setAccountRefreshing(uuid);

      log('401 on ${err.response?.realUri} — starting $uuid token refresh');

      final res = await tokenService.refreshToken(account);

      await res.fold(
        (refreshErr) async {
          log('Token refresh failed for $uuid — logging out');
          tokenService.unsetAccountRefreshing(uuid);
          completer.complete(false);
          _platformRefreshCompleters.remove(uuid);
          await authRepo.removeAccount(account);
          handler.next(err);
        },
        (_) async {
          tokenService.unsetAccountRefreshing(uuid);
          completer.complete(true);
          _platformRefreshCompleters.remove(uuid);

          await _attachTokenAndRetry(account.tokenHash, err, handler);
        },
      );
      return;
    }

    if (statusCode == 429) {
      final resetVal = err.response?.headers.value('x-ratelimit-reset');
      if (resetVal != null) {
        _rateLimitReset = DateTime.fromMillisecondsSinceEpoch(
          (int.tryParse(resetVal) ?? 0) * 1000,
          isUtc: true,
        );
      }
    }

    return super.onError(err, handler);
  }

  Future<void> _attachTokenAndRetry(
    String tokenHash,
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final token = await tokenService.getAccessToken(tokenHash);
    await token.fold(
      (_) async => handler.next(err),
      (accessToken) async => _retry(err.requestOptions, accessToken, handler),
    );
  }

  Future<void> _retry(
    RequestOptions requestOptions,
    String token,
    ErrorInterceptorHandler handler,
  ) async {
    try {
      requestOptions.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      final response = await dio.fetch(requestOptions);
      handler.resolve(response);
    } on DioException catch (retryErr) {
      handler.next(retryErr);
    }
  }
}

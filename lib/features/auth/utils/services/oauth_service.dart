import 'dart:async';
import 'dart:convert';

import 'package:app_links/app_links.dart';
import 'package:forkd/core/common/errors.dart';
import 'package:forkd/core/common/strings.dart';
import 'package:forkd/core/utils/utils.dart';
import 'package:forkd/dependency_injection.dart';
import 'package:forkd/features/auth/data/models/token.dart';
import 'package:forkd/features/auth/domain/entities/account_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import 'package:nanoid/nanoid.dart';
import 'package:crypto/crypto.dart';

class OauthService {
  StreamSubscription? _linkSub;
  Completer<Uri?>? _callbackCompleter;
  final _appLinks = AppLinks();

  // Retrieve the logger instance via dependency injection
  final _logger = di<Logger>();

  Future<Either<AppError, (AccountEntity, TokenModel)>> call(
    String domain, {
    required Future<(AccountEntity, TokenModel)> Function({
      required String domain,
      required String code,
      required String codeVerifier,
      required String redirectUri,
    })
    onCodeRecived,
  }) async {
    _logger.i('Initiating OAuth flow for domain: $domain');

    // Identifiers
    final redirectUri = '$appUriScheme://$appUriBase/auth/gitlab';
    final localOAuthState = nanoid(64);
    final codeVerifier = nanoid(64);
    final codeChallenge = base64UrlEncode(
      sha256.convert(utf8.encode(codeVerifier)).bytes,
    ).replaceAll('=', ''); // S256, no padding

    _logger.d(
      'OAuth Identifiers Generated:\n'
      '- Redirect URI: $redirectUri\n'
      '- State: $localOAuthState\n'
      '- Code Challenge: $codeChallenge',
    );

    final uri = Uri.parse(
      'https://$domain$gitlabOAuthPath'
      '?client_id=$gitlabClientId'
      '&redirect_uri=$redirectUri'
      '&response_type=code'
      '&state=$localOAuthState'
      '&scope=read_user+read_api'
      '&code_challenge=$codeChallenge'
      '&code_challenge_method=S256',
    );

    _callbackCompleter = Completer<Uri?>();
    _listenForCallback();

    _logger.d('Attempting to launch external browser URI: $uri');
    final launch = await launchUri(uri);

    if (launch.isLeft()) {
      _logger.e('OAuth aborting: Failed to launch external browser URI.');
      _cleanup();
      return left(AuthError.launchError());
    }

    _logger.d(
      'Browser launched successfully. Waiting for App Link callback (5 min timeout)...',
    );
    final callbackUri = await _callbackCompleter!.future.timeout(
      const Duration(minutes: 5),
      onTimeout: () {
        _logger.w('OAuth timed out after 5 minutes waiting for deep link.');
        return null;
      },
    );

    _cleanup();

    if (callbackUri == null) {
      _logger.e('OAuth tracking halted: Callback URI is null.');
      return left(AuthError.unknown());
    }

    final returnedCode = callbackUri.queryParameters['code'];
    final returnedState = callbackUri.queryParameters['state'];

    _logger.d(
      'Deep link parameters received:\n'
      '- Returned Code: ${returnedCode != null ? '[PROTECTED]' : 'NULL'}\n'
      '- Returned State: $returnedState',
    );

    if (returnedState != localOAuthState) {
      _logger.e(
        'Security Mismatch Flagged!\n'
        'Expected state: $localOAuthState\n'
        'Received state: $returnedState',
      );
      return left(AuthError.securityFailure());
    }

    if (returnedCode == null) {
      _logger.e(
        'OAuth verification failed: Authorization code missing from callback URI query parameters.',
      );
      return left(AuthError.securityFailure());
    }

    _logger.i(
      'OAuth security verified. Invoking token exchange backend handler...',
    );
    final resultTuple = await onCodeRecived(
      code: returnedCode,
      codeVerifier: codeVerifier,
      domain: domain,
      redirectUri: redirectUri,
    );

    _logger.i('OAuth flow completely executed successfully.');
    return right(resultTuple);
  }

  void _listenForCallback() {
    _logger.d('Attaching AppLinks deep-link stream listener.');
    _linkSub = _appLinks.uriLinkStream.listen(
      (uri) {
        _logger.d('Incoming App Link intercepted by stream listener: $uri');

        if (uri.scheme == appUriScheme && uri.host == appUriBase) {
          _logger.d(
            'App Link signature match identified targeting host: $appUriBase',
          );

          if (!(_callbackCompleter?.isCompleted ?? true)) {
            _logger.i(
              'Completing internal OAuth future with deep-link URI path: ${uri.path}',
            );
            _callbackCompleter!.complete(uri);
          } else {
            _logger.w(
              'App Link received but internal completer was already completed or null.',
            );
          }
        }
      },
      onError: (Object err) {
        _logger.e('Error encountered within AppLinks deep-link stream: $err');
      },
    );
  }

  void _cleanup() {
    _logger.d('Executing OAuth Service resource teardown and cleanup.');
    _linkSub?.cancel();
    _linkSub = null;
    _callbackCompleter = null;
  }
}

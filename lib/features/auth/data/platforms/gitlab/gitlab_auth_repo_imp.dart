import 'dart:async';

import 'package:forkd/features/auth/data/models/token.dart';
import 'package:forkd/features/auth/data/platforms/gitlab/datasource/gitlab.dart';
import 'package:forkd/features/auth/domain/entities/account_entity.dart';
import 'package:forkd/features/auth/domain/repositories/gitlab_auth_repo.dart';
import 'package:forkd/features/auth/utils/services/oauth_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';

class GitlabAuthRepoImp implements GitlabAuthRepo {
  GitlabAuthRepoImp({
    required GitlabDataSource gitlabDataSource,
    required this.logger,
  }) : _dataSource = gitlabDataSource;

  final GitlabDataSource _dataSource;
  final Logger logger;
  final _oauthService = OauthService();

  @override
  Future<Either<Exception, (AccountEntity, TokenModel)>> loginWithToken({
    required String token,
    required String domain,
  }) async {
    try {
      final account = await _dataSource.loginWithToken(domain, token);
      return Either.right((
        account.toEntity(),
        TokenModel.fromJson({'access_token': token}),
      ));
    } on Exception catch (e) {
      return Either.left(e);
    }
  }

  @override
  Future<Either<Exception, (AccountEntity, TokenModel)>> loginWithOAuth({
    required String domain,
    required String clientId,
  }) async {
    final res = await _oauthService.call(
      domain,
      clientId: clientId,
      onCodeRecived: _onCodeRecived,
    );
    return res.fold((e) => left(Exception(e.toString())), right);
  }

  Future<(AccountEntity, TokenModel)> _onCodeRecived({
    required String code,
    required String codeVerifier,
    required String domain,
    required String redirectUri,
    required String clientId,
  }) async {
    final token = await _dataSource.exchangeCodeForToken(
      domain: domain,
      code: code,
      codeVerifier: codeVerifier,
      redirectUri: redirectUri,
      clientId: clientId,
    );
    final account = await _dataSource.loginWithToken(
      domain,
      token.accessToken,
      clientId: clientId,
    );

    return (account.toEntity(), token);
  }
}

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:forkd/core/common/enums.dart';
import 'package:forkd/core/common/errors.dart';
import 'package:forkd/core/common/strings.dart';
import 'package:forkd/features/auth/data/models/token.dart';
import 'package:forkd/features/auth/domain/entities/account_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:nanoid/nanoid.dart';

class ForkdTokenService {
  static const _storage = FlutterSecureStorage();

  String _genTokenHash() => nanoid(32);

  Future<Either<Exception, String>> addToken(
    TokenModel token, {
    String? useHash,
  }) async {
    final hash = useHash ?? _genTokenHash();
    try {
      await _storage.write(key: hash, value: jsonEncode(token.toJson()));
    } on Exception catch (e) {
      return Either.left(e);
    }

    return Either.right(hash);
  }

  Future<Either<Exception, String>> getAccessToken(String tokenHash) async {
    try {
      final token = await _storage.read(key: tokenHash);
      if (token == null) throw Exception('token not avaiable in storage');
      final tokenData = TokenModel.fromJson(
        jsonDecode(token) as Map<String, dynamic>,
      );
      return Either.right(tokenData.accessToken);
    } on Exception catch (e) {
      return Either.left(e);
    }
  }

  Future<Either<Exception, TokenModel>> getToken(String tokenHash) async {
    try {
      final token = await _storage.read(key: tokenHash);
      if (token == null) throw Exception('token not avaiable in storage');
      final tokenData = TokenModel.fromJson(
        jsonDecode(token) as Map<String, dynamic>,
      );
      return Either.right(tokenData);
    } on Exception catch (e) {
      return Either.left(e);
    }
  }

  Future<Either<Exception, void>> removeToken(String tokenHash) async {
    try {
      await _storage.delete(key: tokenHash);
    } on Exception catch (e) {
      return Either.left(e);
    }
    return Either.right(null);
  }

  /// Fetches new token for the platform,
  /// takes [AccountEntity] and [TokenModel].
  /// function starts a new isolate to do so;
  /// also updates the storage and returns the new account & token.
  ///
  // ignore: lines_longer_than_80_chars
  /// User needs to be logged out in case of no refresh token or error for the server.
  Future<Either<NetworkError, TokenModel>> refreshToken(
    AccountEntity account,
  ) async {
    final tokenResult = await getToken(account.tokenHash);

    if (tokenResult.isLeft()) {
      return left(NetworkError.noRefreshToken());
    }

    final token = tokenResult.getOrElse((_) => throw Exception());
    if (token.refreshToken == null) {
      return left(NetworkError.noRefreshToken());
    }

    try {
      switch (account.platform) {
        case Platform.gitlab:
          final clientId = switch (account) {
            GitlabAccountEntity(:final clientId) => clientId,
            _ => gitlabClientId,
          };
          final newToken = await _refreshGitlabToken(
            account.domain,
            token.refreshToken!,
            clientId,
          );
          await addToken(newToken, useHash: account.tokenHash);
          return right(newToken);
        case Platform.github:
        case Platform.gitee:
          // TODO(nipunattri1): implement token refresh for GitHub/Gitee platforms.
          return left(NetworkError.noRefreshToken());
      }
    } on Exception catch (e) {
      return left(NetworkError.unknown(e));
    }
  }

  // TODO(nipunattri1): switch to dio
  Future<TokenModel> _refreshGitlabToken(
    String domain,
    String token,
    String clientId,
  ) async {
    final domainlocal = domain.trim();

    final tokenUri = domainlocal.startsWith('http://') ||
            domainlocal.startsWith('https://')
        ? Uri.parse(domainlocal).replace(path: '/oauth/token')
        : Uri.https(domainlocal, '/oauth/token');
    const redirectUri = '$appUriScheme://$appUriBase/auth/gitlab';

    final body = {
      'client_id': clientId,
      'grant_type': 'refresh_token',
      'redirect_uri': redirectUri,
      'refresh_token': token,
    };
    final tokenRes = await http.post(
      tokenUri,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: body,
    );
    if (tokenRes.statusCode != 200) {
      throw Exception(
        'Token refresh failed ${tokenRes.statusCode}: ${tokenRes.body}',
      );
    }

    final tokenData = json.decode(tokenRes.body) as Map<String, dynamic>;

    if (tokenData['error'] != null) {
      throw Exception(
        'Token error: ${tokenData['error']} — ${tokenData['error_description'] ?? ''}',
      );
    }
    final allTokenData = TokenModel.fromJson(tokenData);

    return allTokenData;
  }
}

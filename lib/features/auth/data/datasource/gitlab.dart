import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:forkd/core/common/strings.dart';
import 'package:forkd/features/auth/data/models/account.dart';
import 'package:forkd/features/auth/data/models/api/gitlab.dart';
import 'package:forkd/features/auth/data/models/token.dart';
import 'package:http/http.dart' as http;

class GitlabDataSource {
  Future<AccountModel> loginWithToken(String domain, String token) async {
    final tokenTrimmed = token.trim();

    final uri = Uri.https(domain.trim(), '/api/v4/user');
    final res = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $tokenTrimmed'},
    );

    if (res.statusCode != 200) {
      throw Exception('GitLab API error ${res.statusCode}: ${res.body}');
    }

    final info = json.decode(res.body) as Map<String, dynamic>;

    if (info['message'] != null) {
      throw Exception('GitLab error: ${info['message']}');
    }
    if (info['error'] != null) {
      throw Exception(
        'GitLab error: ${info['error']} — ${info['error_description'] ?? ''}',
      );
    }

    final user = ApiGitlabUser.fromJson(info);
    return AccountModel.gitlab(
      tokenHash: tokenTrimmed,
      username: user.username!,
      avatarUrl: user.avatarUrl!,
      gitlabId: user.id ?? -1,
      domain: domain,
      name: user.name ?? '??',
      bio: user.bio ?? '??',
      accessLevel: user.accessLevel ?? -1,
    );
  }

  Future<TokenModel> exchangeCodeForToken({
    required String domain,
    required String code,
    required String codeVerifier,
    required String redirectUri,
  }) async {
    final tokenUri = Uri.https(domain.trim(), '/oauth/token');
    final body = {
      'client_id': gitlabClientId,
      'code': code,
      'grant_type': 'authorization_code',
      'redirect_uri': redirectUri,
      'code_verifier': codeVerifier,
    };
    final tokenRes = await http.post(
      tokenUri,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: body,
    );
    if (kDebugMode) {
      print('next: $body');
    }

    if (tokenRes.statusCode != 200) {
      throw Exception(
        'Token exchange failed ${tokenRes.statusCode}: ${tokenRes.body}',
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

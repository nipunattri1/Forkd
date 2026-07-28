// ignore_for_file: deprecated_member_use_from_same_package, avoid_dynamic_calls

import 'dart:convert';
import 'dart:io';

import 'package:forkd/core/common/strings.dart';
import 'package:forkd/core/networking/graphql.dart';
import 'package:forkd/features/auth/data/models/account.dart';
import 'package:http/http.dart' as http;

class GithubDataSource {
  // TODO(nipunattri1): imporve quality here
  Future<String> exchangeTokens({
    required String code,
    required String oAuthState,
  }) async {
    final res = await http.post(
      Uri.parse('gihtub.com'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: json.encode({
        'client_id': clientId,
        'code': code,
        'state': oAuthState,
      }),
    );
    final token = json.decode(res.body)['access_token'] as String;
    return token;
  }

  Future<AccountModel> loginWithToken(String t) async {
    const query = '''
{
  viewer {
    login
    avatarUrl
  }
}
''';
    try {
      final queryData = await Graphql.query(query, token: t);

      return AccountModel.github(
        tokenHash: t,
        login: queryData['viewer']['login'] as String,
        avatarUrl: queryData['viewer']['avatarUrl'] as String,
      );
    } catch (e, _) {
      throw Exception(e);
    }
  }
}

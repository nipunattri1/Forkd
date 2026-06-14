import 'dart:convert';
import 'dart:io';

import 'package:forkd/core/common/strings.dart';
import 'package:http/http.dart' as http;

@Deprecated('old service needs to be migrated')
class Graphql {
  // TODO: Migrate Graphql to functional err handling
  static Future<dynamic> query(String query, {String? token}) async {
    final res = await http
        .post(
          Uri.parse('$githubApiPrefix/graphql'),
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: json.encode({'query': query}),
        )
        .timeout(const Duration(seconds: 10));

    // Fimber.d(res.body);
    final data = json.decode(res.body);

    if (data['errors'] != null) {
      throw data['errors'][0]['message'];
    }

    return data['data'];
  }
}

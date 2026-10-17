import 'package:dio/dio.dart';
import 'package:forkd/dependency_injection.dart';

class NetworkingHelpers {
  /// Reads every page of a GitLab list endpoint by following `X-Next-Page`.
  static Future<List<Map<String, dynamic>>> getAllPages(
    Dio dio,
    String path,
    Map<String, dynamic> query,
  ) async {
    final items = <Map<String, dynamic>>[];
    var page = 1;
    while (true) {
      final res = await dio.get<dynamic>(
        path,
        queryParameters: {...query, 'per_page': 100, 'page': page},
      );
      final status = res.statusCode ?? 0;
      if (status >= 400) {
        throw Exception('GitLab API error $status: ${res.data}');
      }
      final data = res.data;
      if (data is! List) {
        throw Exception('GitLab API error: unexpected response $data');
      }
      items.addAll(data.cast<Map<String, dynamic>>());

      // Empty, same page or unparsable header means we are done.
      final next = int.tryParse(res.headers.value('x-next-page') ?? '');
      if (next == null || next <= page) break;
      page = next;
    }
    return items;
  }

  static void configureDio({required String domain}) {
    var formattedBaseUrl = domain.trim();

    if (!formattedBaseUrl.startsWith('http://') &&
        !formattedBaseUrl.startsWith('https://')) {
      formattedBaseUrl = 'https://$formattedBaseUrl';
    }

    di<Dio>().options = BaseOptions(
        baseUrl: formattedBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      );
  }
}

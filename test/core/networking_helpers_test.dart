import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forkd/core/networking/networking_helpers.dart';

/// Serves [pages] in order and reports the next page via `X-Next-Page`.
class _PagedAdapter implements HttpClientAdapter {
  _PagedAdapter(this.pages);

  final List<List<Map<String, dynamic>>> pages;
  int calls = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final page = int.tryParse('${options.queryParameters['page']}') ?? 1;
    calls++;
    final hasNext = page < pages.length;
    return ResponseBody.fromString(
      jsonEncode(pages[page - 1]),
      200,
      headers: {
        'content-type': ['application/json'],
        if (hasNext) 'x-next-page': ['${page + 1}'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

/// Always claims page 1 is next, so a naive loop would never terminate.
class _LoopingAdapter implements HttpClientAdapter {
  int calls = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    calls++;
    return ResponseBody.fromString(
      jsonEncode([
        {'id': 1},
      ]),
      200,
      headers: {
        'content-type': ['application/json'],
        'x-next-page': ['1'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  test('getAllPages follows X-Next-Page and concatenates every page', () async {
    final adapter = _PagedAdapter([
      [
        {'id': 1},
        {'id': 2},
      ],
      [
        {'id': 3},
      ],
    ]);
    final dio = Dio()..httpClientAdapter = adapter;

    final items = await NetworkingHelpers.getAllPages(
      dio,
      '/api/v4/todos',
      {'state': 'pending'},
    );

    expect(items.map((e) => e['id']), [1, 2, 3]);
    expect(adapter.calls, 2);
  });

  test('getAllPages stops when the server repeats the same next page', () async {
    final adapter = _LoopingAdapter();
    final dio = Dio()..httpClientAdapter = adapter;

    final items = await NetworkingHelpers.getAllPages(
      dio,
      '/api/v4/todos',
      const {},
    );

    expect(items.length, 1);
    expect(adapter.calls, 1);
  });
}

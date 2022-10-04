import 'dart:convert';

import 'package:chuck_norris/data/api/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

class DioFactory {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        responseType: ResponseType.json,
        connectTimeout: 5000,
      ),
    );

    (dio.transformer as DefaultTransformer).jsonDecodeCallback = _parseJson;
    return dio;
  }

  // static void _putLogsInLogger(Object object) => logger.i(object.toString());

  static _parseJson(String text) {
    return compute(_parseAndDecode, text);
  }

  static _parseAndDecode(String response) {
    return jsonDecode(response);
  }
}

final dioProvider = Provider<Dio>((ref) {
  return DioFactory.create();
});

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../constants.dart';

// ignore: prefer_mixin
class AppDio with DioMixin implements Dio {
  AppDio._([BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: Constants.of().endpoint,
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;
    interceptors.add(InterceptorsWrapper(onRequest: (options) async {
      options.headers.addAll(await userAgentClientHintsHeader());
    }));

    // Firebase Performance
    // TODO: dio_firebase_performance does not yet support NNBD.
    // interceptors.add(DioFirebasePerformanceInterceptor());

    if (kDebugMode) {
      // Local Log
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance() => AppDio._();
}

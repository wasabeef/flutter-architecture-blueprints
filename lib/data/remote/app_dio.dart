import 'package:app/constants.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class AppDio with DioMixin implements Dio {
  AppDio([BaseOptions options]) {
    options = BaseOptions(
      baseUrl: Constants.of().endpoint,
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;
    httpClientAdapter = DefaultHttpClientAdapter();
  }
}

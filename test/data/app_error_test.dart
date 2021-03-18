import 'dart:io';

import 'package:app/data/app_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AppError Test', () async {
    expect(
        AppError(
          DioError(
              type: DioErrorType.connectTimeout,
              requestOptions: RequestOptions(path: '')),
        ).type,
        equals(AppErrorType.timeout));

    expect(
        AppError(
          DioError(
              type: DioErrorType.receiveTimeout,
              requestOptions: RequestOptions(path: '')),
        ).type,
        equals(AppErrorType.timeout));

    expect(
        AppError(
          DioError(
              type: DioErrorType.sendTimeout,
              requestOptions: RequestOptions(path: '')),
        ).type,
        equals(AppErrorType.network));

    expect(
        AppError(
          DioError(
              type: DioErrorType.response,
              requestOptions: RequestOptions(path: ''),
              response: Response(
                  requestOptions: RequestOptions(path: ''), statusCode: 400)),
        ).type,
        equals(AppErrorType.badRequest));

    expect(
        AppError(
          DioError(
              type: DioErrorType.response,
              requestOptions: RequestOptions(path: ''),
              response: Response(
                  requestOptions: RequestOptions(path: ''), statusCode: 401)),
        ).type,
        equals(AppErrorType.unauthorized));

    expect(
        AppError(
          DioError(
              type: DioErrorType.response,
              requestOptions: RequestOptions(path: ''),
              response: Response(
                  requestOptions: RequestOptions(path: ''), statusCode: 500)),
        ).type,
        equals(AppErrorType.server));

    expect(
        AppError(
          DioError(
              type: DioErrorType.cancel,
              requestOptions: RequestOptions(path: '')),
        ).type,
        equals(AppErrorType.cancel));

    expect(
        AppError(
          DioError(
              error: const SocketException('Failed host lookup: wasabeef.jp'),
              type: DioErrorType.other,
              requestOptions: RequestOptions(path: '')),
        ).type,
        equals(AppErrorType.network));

    expect(
        AppError(
          DioError(
              type: DioErrorType.other,
              requestOptions: RequestOptions(path: '')),
        ).type,
        equals(AppErrorType.unknown));

    expect(AppError(const FileSystemException()).type,
        equals(AppErrorType.unknown));

    expect(AppError(null).type, equals(AppErrorType.unknown));
  });
}

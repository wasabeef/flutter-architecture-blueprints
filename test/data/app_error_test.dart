import 'dart:io';

import 'package:app/data/app_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AppError Test', () async {
    expect(
        AppError(
          DioError(type: DioErrorType.connectTimeout),
        ).type,
        equals(AppErrorType.timeout));

    expect(
        AppError(
          DioError(type: DioErrorType.receiveTimeout),
        ).type,
        equals(AppErrorType.timeout));

    expect(
        AppError(
          DioError(type: DioErrorType.sendTimeout),
        ).type,
        equals(AppErrorType.network));

    expect(
        AppError(
          DioError(
              type: DioErrorType.response,
              response:
                  Response(statusCode: 400, request: RequestOptions(path: ''))),
        ).type,
        equals(AppErrorType.badRequest));

    expect(
        AppError(
          DioError(
              type: DioErrorType.response,
              response:
                  Response(statusCode: 401, request: RequestOptions(path: ''))),
        ).type,
        equals(AppErrorType.unauthorized));

    expect(
        AppError(
          DioError(
              type: DioErrorType.response,
              response:
                  Response(statusCode: 500, request: RequestOptions(path: ''))),
        ).type,
        equals(AppErrorType.server));

    expect(
        AppError(
          DioError(type: DioErrorType.cancel),
        ).type,
        equals(AppErrorType.cancel));

    expect(
        AppError(
          DioError(
              error: const SocketException('Failed host lookup: wasabeef.jp'),
              type: DioErrorType.other),
        ).type,
        equals(AppErrorType.network));

    expect(
        AppError(
          DioError(type: DioErrorType.other),
        ).type,
        equals(AppErrorType.unknown));

    expect(AppError(const FileSystemException()).type,
        equals(AppErrorType.unknown));

    expect(AppError(null).type, equals(AppErrorType.unknown));
  });
}

import 'dart:io';

import 'package:app/data/app_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AppError Test', () async {
    expect(
        AppError(
          DioError(type: DioErrorType.CONNECT_TIMEOUT),
        ).type,
        equals(AppErrorType.timeout));

    expect(
        AppError(
          DioError(type: DioErrorType.RECEIVE_TIMEOUT),
        ).type,
        equals(AppErrorType.timeout));

    expect(
        AppError(
          DioError(type: DioErrorType.SEND_TIMEOUT),
        ).type,
        equals(AppErrorType.network));

    expect(
        AppError(
          DioError(
              type: DioErrorType.RESPONSE, response: Response(statusCode: 400)),
        ).type,
        equals(AppErrorType.badRequest));

    expect(
        AppError(
          DioError(
              type: DioErrorType.RESPONSE, response: Response(statusCode: 401)),
        ).type,
        equals(AppErrorType.unauthorized));

    expect(
        AppError(
          DioError(
              type: DioErrorType.RESPONSE, response: Response(statusCode: 500)),
        ).type,
        equals(AppErrorType.server));

    expect(
        AppError(
          DioError(type: DioErrorType.CANCEL),
        ).type,
        equals(AppErrorType.cancel));

    expect(
        AppError(
          DioError(
              error: const SocketException('Failed host lookup: wasabeef.jp'),
              type: DioErrorType.DEFAULT),
        ).type,
        equals(AppErrorType.network));

    expect(
        AppError(
          DioError(type: DioErrorType.DEFAULT),
        ).type,
        equals(AppErrorType.unknown));

    expect(AppError(FileSystemException()).type, equals(AppErrorType.unknown));

    expect(AppError(null).type, equals(AppErrorType.unknown));
  });
}

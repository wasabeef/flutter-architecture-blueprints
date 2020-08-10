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
        equals(AppErrorType.NETWORK));

    expect(
        AppError(
          DioError(type: DioErrorType.RECEIVE_TIMEOUT),
        ).type,
        equals(AppErrorType.NETWORK));

    expect(
        AppError(
          DioError(type: DioErrorType.SEND_TIMEOUT),
        ).type,
        equals(AppErrorType.NETWORK));

    expect(
        AppError(
          DioError(type: DioErrorType.RESPONSE),
        ).type,
        equals(AppErrorType.SERVER));

    expect(
        AppError(
          DioError(type: DioErrorType.CANCEL),
        ).type,
        equals(AppErrorType.CANCEL));

    expect(
        AppError(
          DioError(
              error: const SocketException('Failed host lookup: wasabeef.jp'),
              type: DioErrorType.DEFAULT),
        ).type,
        equals(AppErrorType.NETWORK));

    expect(
        AppError(
          DioError(type: DioErrorType.DEFAULT),
        ).type,
        equals(AppErrorType.UNKNOWN));

    expect(AppError(ArgumentError()).type, equals(AppErrorType.UNKNOWN));

    expect(AppError(null).type, equals(AppErrorType.UNKNOWN));
  });
}

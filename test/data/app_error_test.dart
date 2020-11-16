import 'dart:io';

import 'package:app/data/app_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AppError Test', () async {
    expect(
        ApiError(
          DioError(type: DioErrorType.CONNECT_TIMEOUT),
        ).type,
        equals(ApiErrorType.timeout));

    expect(
        ApiError(
          DioError(type: DioErrorType.RECEIVE_TIMEOUT),
        ).type,
        equals(ApiErrorType.timeout));

    expect(
        ApiError(
          DioError(type: DioErrorType.SEND_TIMEOUT),
        ).type,
        equals(ApiErrorType.network));

    expect(
        ApiError(
          DioError(
              type: DioErrorType.RESPONSE, response: Response(statusCode: 400)),
        ).type,
        equals(ApiErrorType.badRequest));

    expect(
        ApiError(
          DioError(
              type: DioErrorType.RESPONSE, response: Response(statusCode: 401)),
        ).type,
        equals(ApiErrorType.unauthorized));

    expect(
        ApiError(
          DioError(
              type: DioErrorType.RESPONSE, response: Response(statusCode: 500)),
        ).type,
        equals(ApiErrorType.server));

    expect(
        ApiError(
          DioError(type: DioErrorType.CANCEL),
        ).type,
        equals(ApiErrorType.cancel));

    expect(
        ApiError(
          DioError(
              error: const SocketException('Failed host lookup: wasabeef.jp'),
              type: DioErrorType.DEFAULT),
        ).type,
        equals(ApiErrorType.network));

    expect(
        ApiError(
          DioError(type: DioErrorType.DEFAULT),
        ).type,
        equals(ApiErrorType.unknown));

    expect(ApiError(ArgumentError()).type, equals(ApiErrorType.unknown));

    expect(ApiError(null).type, equals(ApiErrorType.unknown));
  });
}

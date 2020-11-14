import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum ApiErrorType {
  network,
  badRequest,
  unauthorized,
  cancel,
  unknown,
}

class ApiError {
  ApiError(dynamic error) {
    if (error is DioError) {
      debugPrint('AppError(DioError): ${error.message}');
      message = error.message;
      switch (error.type) {
        case DioErrorType.DEFAULT:
          if (error.error is SocketException) {
            // SocketException: Failed host lookup: '***'
            // (OS Error: No address associated with hostname, errno = 7)
            type = ApiErrorType.network;
          } else {
            type = ApiErrorType.unknown;
          }
          break;
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
          type = ApiErrorType.network;
          break;
        case DioErrorType.RESPONSE:
          // TODO(api): need define more http status;
          if (error.response.statusCode == HttpStatus.badRequest) {
            // 400
            type = ApiErrorType.badRequest;
          } else if (error.response.statusCode == HttpStatus.unauthorized) {
            // 401
            type = ApiErrorType.unauthorized;
          } else {
            type = ApiErrorType.unknown;
          }
          break;
        case DioErrorType.CANCEL:
          type = ApiErrorType.cancel;
          break;
        default:
          type = ApiErrorType.unknown;
      }
    } else {
      debugPrint('AppError(UnKnown): $error');
      type = ApiErrorType.unknown;
      message = 'AppError: $error';
    }
  }

  String message;
  ApiErrorType type;
}

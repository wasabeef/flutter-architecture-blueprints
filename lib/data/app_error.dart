import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum ApiErrorType {
  network,
  badRequest,
  unauthorized,
  cancel,
  timeout,
  server,
  unknown,
}

class ApiError {
  String message;
  ApiErrorType type;

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
          type = ApiErrorType.timeout;
          break;
        case DioErrorType.SEND_TIMEOUT:
          type = ApiErrorType.network;
          break;
        case DioErrorType.RESPONSE:
          // TODO(api): need define more http status;
          switch (error.response.statusCode) {
            case HttpStatus.badRequest: // 400
              type = ApiErrorType.badRequest;
              break;
            case HttpStatus.unauthorized: // 401
              type = ApiErrorType.unauthorized;
              break;
            case HttpStatus.internalServerError: // 500
            case HttpStatus.badGateway: // 502
            case HttpStatus.serviceUnavailable: // 503
            case HttpStatus.gatewayTimeout: // 504
              type = ApiErrorType.server;
              break;
            default:
              type = ApiErrorType.unknown;
              break;
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
}

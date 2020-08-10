import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum AppErrorType { NETWORK, SERVER, CANCEL, UNKNOWN }

class AppError {
  AppError(dynamic error) {
    if (error is DioError) {
      debugPrint('AppError(DioError): ${error.message}');
      message = error.message;
      switch (error.type) {
        case DioErrorType.DEFAULT:
          if (error.error is SocketException) {
            // SocketException: Failed host lookup: '***'
            // (OS Error: No address associated with hostname, errno = 7)
            type = AppErrorType.NETWORK;
          } else {
            type = AppErrorType.UNKNOWN;
          }
          break;
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
          type = AppErrorType.NETWORK;
          break;
        case DioErrorType.RESPONSE:
          type = AppErrorType.SERVER;
          break;
        case DioErrorType.CANCEL:
          type = AppErrorType.CANCEL;
          break;
        default:
          type = AppErrorType.UNKNOWN;
      }
    } else if (error is Error) {
      debugPrint('AppError(Error): ${error.stackTrace.toString()}');
      type = AppErrorType.UNKNOWN;
      message = 'AppError: ${error.stackTrace.toString()}';
    } else {
      debugPrint('AppError(UnKnown): $error');
      type = AppErrorType.UNKNOWN;
      message = 'AppError: $error';
    }
  }

  Error error;
  String message;
  AppErrorType type;
}

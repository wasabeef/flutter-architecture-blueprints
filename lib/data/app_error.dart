import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum AppErrorType { network, server, cancel, unknown }

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
            type = AppErrorType.network;
          } else {
            type = AppErrorType.unknown;
          }
          break;
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
          type = AppErrorType.network;
          break;
        case DioErrorType.RESPONSE:
          type = AppErrorType.server;
          break;
        case DioErrorType.CANCEL:
          type = AppErrorType.cancel;
          break;
        default:
          type = AppErrorType.unknown;
      }
    } else if (error is Error) {
      debugPrint('AppError(Error): ${error.stackTrace.toString()}');
      type = AppErrorType.unknown;
      message = 'AppError: ${error.stackTrace.toString()}';
    } else {
      debugPrint('AppError(UnKnown): $error');
      type = AppErrorType.unknown;
      message = 'AppError: $error';
    }
  }

  String message;
  AppErrorType type;
}

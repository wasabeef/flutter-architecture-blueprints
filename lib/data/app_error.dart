import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum AppErrorType { TIMEOUT, SERVER, CANCEL, UNKNOWN }

class AppError {
  AppError(dynamic error) {
    if (error is DioError) {
      debugPrint('AppError(DioError): ${error.message}');
      switch (error.type) {
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
          type = AppErrorType.TIMEOUT;
          break;
        case DioErrorType.RESPONSE:
          type = AppErrorType.SERVER;
          break;
        case DioErrorType.CANCEL:
          type = AppErrorType.CANCEL;
          break;
        case DioErrorType.DEFAULT:
        default:
          type = AppErrorType.UNKNOWN;
      }
    } else if (error is Error) {
      debugPrint('AppError(Error): ${error.stackTrace.toString()}');
      type = AppErrorType.UNKNOWN;
    } else {
      debugPrint('AppError(UnKnown): $error');
      type = AppErrorType.UNKNOWN;
    }
  }

  Error error;
  AppErrorType type;
}

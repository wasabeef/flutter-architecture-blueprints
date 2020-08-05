import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AppError {
  AppError({
    dynamic error,
    Function unauthenticated,
    Function notFound,
    Function any,
  }) {
    if (error is DioError) {
      debugPrint('AppError(DioError): ${error.message}');
      debugPrint(
          'AppError(DioError): ${error.response?.request?.method} ${error.response?.request?.baseUrl}${error.response?.request?.path}');
      switch (error.response?.statusCode) {
        case 401:
          unauthenticated?.call();
          break;
        case 404:
          notFound?.call();
          break;
        default:
          any?.call();
          break;
      }
    } else if (error is Error) {
      debugPrint('AppError(Error): ${error.stackTrace.toString()}');
    } else {
      debugPrint('AppError(UnKnown): $error');
    }
  }
}

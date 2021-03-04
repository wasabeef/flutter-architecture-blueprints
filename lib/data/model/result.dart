import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_error.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const Result._();

  const factory Result.success({T data}) = Success<T>;

  const factory Result.failure({@required AppError error}) = Failure<T>;

  static Result<T> guard<T>(T Function() body) {
    try {
      return Result.success(data: body());
    } on Exception catch (e) {
      return Result.failure(error: AppError(e));
    }
  }

  static Future<Result<T>> guardFuture<T>(Future<T> Function() future) async {
    try {
      return Result.success(data: await future());
    } on Exception catch (e) {
      return Result.failure(error: AppError(e));
    }
  }

  bool get isSuccess => when(success: (data) => true, failure: (e) => false);

  bool get isFailure => !isSuccess;

  void ifSuccess(Function(T data) body) {
    maybeWhen(
      success: (data) => body(data),
      orElse: () {
        // no-op
      },
    );
  }

  void ifFailure(Function(AppError e) body) {
    maybeWhen(
      failure: (e) => body(e),
      orElse: () {
        // no-op
      },
    );
  }

  T get dataOrThrow {
    return when(
      success: (data) => data,
      failure: (e) => throw e,
    );
  }
}

extension ResultObjectExt<T> on T {
  Result<T> get asSuccess => Result.success(data: this);

  Result<T> asFailure(Exception e) => Result.failure(error: AppError(e));
}

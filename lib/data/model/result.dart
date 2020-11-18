import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_error.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success({@required T data}) = Success<T>;

  const factory Result.failure({@required AppError error}) = Failure<T>;
}

extension ResultExt on Result {
  bool get isSuccess => when(success: (data) => true, failure: (e) => false);

  bool get isError => !isSuccess;
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ResultTearOff {
  const _$ResultTearOff();

// ignore: unused_element
  Success<T> success<T>({@required T data}) {
    return Success<T>(
      data: data,
    );
  }

// ignore: unused_element
  Failure<T> failure<T>({@required AppError error}) {
    return Failure<T>(
      error: error,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Result = _$ResultTearOff();

/// @nodoc
mixin _$Result<T> {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result success(T data),
    @required Result failure(AppError error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result success(T data),
    Result failure(AppError error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result success(Success<T> value),
    @required Result failure(Failure<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result success(Success<T> value),
    Result failure(Failure<T> value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $ResultCopyWith<T, $Res> {
  factory $ResultCopyWith(Result<T> value, $Res Function(Result<T>) then) =
      _$ResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ResultCopyWithImpl<T, $Res> implements $ResultCopyWith<T, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<T> _value;
  // ignore: unused_field
  final $Res Function(Result<T>) _then;
}

/// @nodoc
abstract class $SuccessCopyWith<T, $Res> {
  factory $SuccessCopyWith(Success<T> value, $Res Function(Success<T>) then) =
      _$SuccessCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class _$SuccessCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res>
    implements $SuccessCopyWith<T, $Res> {
  _$SuccessCopyWithImpl(Success<T> _value, $Res Function(Success<T>) _then)
      : super(_value, (v) => _then(v as Success<T>));

  @override
  Success<T> get _value => super._value as Success<T>;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(Success<T>(
      data: data == freezed ? _value.data : data as T,
    ));
  }
}

/// @nodoc
class _$Success<T> extends Success<T> with DiagnosticableTreeMixin {
  const _$Success({@required this.data})
      : assert(data != null),
        super._();

  @override
  final T data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result<$T>.success(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Result<$T>.success'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success<T> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  $SuccessCopyWith<T, Success<T>> get copyWith =>
      _$SuccessCopyWithImpl<T, Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result success(T data),
    @required Result failure(AppError error),
  }) {
    assert(success != null);
    assert(failure != null);
    return success(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result success(T data),
    Result failure(AppError error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result success(Success<T> value),
    @required Result failure(Failure<T> value),
  }) {
    assert(success != null);
    assert(failure != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result success(Success<T> value),
    Result failure(Failure<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> extends Result<T> {
  const Success._() : super._();
  const factory Success({@required T data}) = _$Success<T>;

  T get data;
  $SuccessCopyWith<T, Success<T>> get copyWith;
}

/// @nodoc
abstract class $FailureCopyWith<T, $Res> {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) then) =
      _$FailureCopyWithImpl<T, $Res>;
  $Res call({AppError error});
}

/// @nodoc
class _$FailureCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res>
    implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(Failure<T> _value, $Res Function(Failure<T>) _then)
      : super(_value, (v) => _then(v as Failure<T>));

  @override
  Failure<T> get _value => super._value as Failure<T>;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(Failure<T>(
      error: error == freezed ? _value.error : error as AppError,
    ));
  }
}

/// @nodoc
class _$Failure<T> extends Failure<T> with DiagnosticableTreeMixin {
  const _$Failure({@required this.error})
      : assert(error != null),
        super._();

  @override
  final AppError error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result<$T>.failure(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Result<$T>.failure'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Failure<T> &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $FailureCopyWith<T, Failure<T>> get copyWith =>
      _$FailureCopyWithImpl<T, Failure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result success(T data),
    @required Result failure(AppError error),
  }) {
    assert(success != null);
    assert(failure != null);
    return failure(error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result success(T data),
    Result failure(AppError error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result success(Success<T> value),
    @required Result failure(Failure<T> value),
  }) {
    assert(success != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result success(Success<T> value),
    Result failure(Failure<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure<T> extends Result<T> {
  const Failure._() : super._();
  const factory Failure({@required AppError error}) = _$Failure<T>;

  AppError get error;
  $FailureCopyWith<T, Failure<T>> get copyWith;
}

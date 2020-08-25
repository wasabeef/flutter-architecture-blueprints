// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
News _$NewsFromJson(Map<String, dynamic> json) {
  return _News.fromJson(json);
}

class _$NewsTearOff {
  const _$NewsTearOff();

// ignore: unused_element
  _News call(
      {@required String status,
      @required int totalResults,
      List<Article> articles}) {
    return _News(
      status: status,
      totalResults: totalResults,
      articles: articles,
    );
  }
}

// ignore: unused_element
const $News = _$NewsTearOff();

mixin _$News {
  String get status;
  int get totalResults;
  List<Article> get articles;

  Map<String, dynamic> toJson();
  $NewsCopyWith<News> get copyWith;
}

abstract class $NewsCopyWith<$Res> {
  factory $NewsCopyWith(News value, $Res Function(News) then) =
      _$NewsCopyWithImpl<$Res>;
  $Res call({String status, int totalResults, List<Article> articles});
}

class _$NewsCopyWithImpl<$Res> implements $NewsCopyWith<$Res> {
  _$NewsCopyWithImpl(this._value, this._then);

  final News _value;
  // ignore: unused_field
  final $Res Function(News) _then;

  @override
  $Res call({
    Object status = freezed,
    Object totalResults = freezed,
    Object articles = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed ? _value.status : status as String,
      totalResults:
          totalResults == freezed ? _value.totalResults : totalResults as int,
      articles:
          articles == freezed ? _value.articles : articles as List<Article>,
    ));
  }
}

abstract class _$NewsCopyWith<$Res> implements $NewsCopyWith<$Res> {
  factory _$NewsCopyWith(_News value, $Res Function(_News) then) =
      __$NewsCopyWithImpl<$Res>;
  @override
  $Res call({String status, int totalResults, List<Article> articles});
}

class __$NewsCopyWithImpl<$Res> extends _$NewsCopyWithImpl<$Res>
    implements _$NewsCopyWith<$Res> {
  __$NewsCopyWithImpl(_News _value, $Res Function(_News) _then)
      : super(_value, (v) => _then(v as _News));

  @override
  _News get _value => super._value as _News;

  @override
  $Res call({
    Object status = freezed,
    Object totalResults = freezed,
    Object articles = freezed,
  }) {
    return _then(_News(
      status: status == freezed ? _value.status : status as String,
      totalResults:
          totalResults == freezed ? _value.totalResults : totalResults as int,
      articles:
          articles == freezed ? _value.articles : articles as List<Article>,
    ));
  }
}

@JsonSerializable()
class _$_News implements _News {
  _$_News({@required this.status, @required this.totalResults, this.articles})
      : assert(status != null),
        assert(totalResults != null);

  factory _$_News.fromJson(Map<String, dynamic> json) =>
      _$_$_NewsFromJson(json);

  @override
  final String status;
  @override
  final int totalResults;
  @override
  final List<Article> articles;

  @override
  String toString() {
    return 'News(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _News &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.totalResults, totalResults) ||
                const DeepCollectionEquality()
                    .equals(other.totalResults, totalResults)) &&
            (identical(other.articles, articles) ||
                const DeepCollectionEquality()
                    .equals(other.articles, articles)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(totalResults) ^
      const DeepCollectionEquality().hash(articles);

  @override
  _$NewsCopyWith<_News> get copyWith =>
      __$NewsCopyWithImpl<_News>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NewsToJson(this);
  }
}

abstract class _News implements News {
  factory _News(
      {@required String status,
      @required int totalResults,
      List<Article> articles}) = _$_News;

  factory _News.fromJson(Map<String, dynamic> json) = _$_News.fromJson;

  @override
  String get status;
  @override
  int get totalResults;
  @override
  List<Article> get articles;
  @override
  _$NewsCopyWith<_News> get copyWith;
}

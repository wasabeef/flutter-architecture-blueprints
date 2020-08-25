// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Article _$ArticleFromJson(Map<String, dynamic> json) {
  return _Article.fromJson(json);
}

class _$ArticleTearOff {
  const _$ArticleTearOff();

// ignore: unused_element
  _Article call(
      {@required Source source,
      String author,
      @required String title,
      @required String description,
      @required String url,
      String urlToImage,
      @required DateTime publishedAt,
      String content}) {
    return _Article(
      source: source,
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
    );
  }
}

// ignore: unused_element
const $Article = _$ArticleTearOff();

mixin _$Article {
  Source get source;
  String get author;
  String get title;
  String get description;
  String get url;
  String get urlToImage;
  DateTime get publishedAt;
  String get content;

  Map<String, dynamic> toJson();
  $ArticleCopyWith<Article> get copyWith;
}

abstract class $ArticleCopyWith<$Res> {
  factory $ArticleCopyWith(Article value, $Res Function(Article) then) =
      _$ArticleCopyWithImpl<$Res>;
  $Res call(
      {Source source,
      String author,
      String title,
      String description,
      String url,
      String urlToImage,
      DateTime publishedAt,
      String content});

  $SourceCopyWith<$Res> get source;
}

class _$ArticleCopyWithImpl<$Res> implements $ArticleCopyWith<$Res> {
  _$ArticleCopyWithImpl(this._value, this._then);

  final Article _value;
  // ignore: unused_field
  final $Res Function(Article) _then;

  @override
  $Res call({
    Object source = freezed,
    Object author = freezed,
    Object title = freezed,
    Object description = freezed,
    Object url = freezed,
    Object urlToImage = freezed,
    Object publishedAt = freezed,
    Object content = freezed,
  }) {
    return _then(_value.copyWith(
      source: source == freezed ? _value.source : source as Source,
      author: author == freezed ? _value.author : author as String,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      url: url == freezed ? _value.url : url as String,
      urlToImage:
          urlToImage == freezed ? _value.urlToImage : urlToImage as String,
      publishedAt:
          publishedAt == freezed ? _value.publishedAt : publishedAt as DateTime,
      content: content == freezed ? _value.content : content as String,
    ));
  }

  @override
  $SourceCopyWith<$Res> get source {
    if (_value.source == null) {
      return null;
    }
    return $SourceCopyWith<$Res>(_value.source, (value) {
      return _then(_value.copyWith(source: value));
    });
  }
}

abstract class _$ArticleCopyWith<$Res> implements $ArticleCopyWith<$Res> {
  factory _$ArticleCopyWith(_Article value, $Res Function(_Article) then) =
      __$ArticleCopyWithImpl<$Res>;
  @override
  $Res call(
      {Source source,
      String author,
      String title,
      String description,
      String url,
      String urlToImage,
      DateTime publishedAt,
      String content});

  @override
  $SourceCopyWith<$Res> get source;
}

class __$ArticleCopyWithImpl<$Res> extends _$ArticleCopyWithImpl<$Res>
    implements _$ArticleCopyWith<$Res> {
  __$ArticleCopyWithImpl(_Article _value, $Res Function(_Article) _then)
      : super(_value, (v) => _then(v as _Article));

  @override
  _Article get _value => super._value as _Article;

  @override
  $Res call({
    Object source = freezed,
    Object author = freezed,
    Object title = freezed,
    Object description = freezed,
    Object url = freezed,
    Object urlToImage = freezed,
    Object publishedAt = freezed,
    Object content = freezed,
  }) {
    return _then(_Article(
      source: source == freezed ? _value.source : source as Source,
      author: author == freezed ? _value.author : author as String,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      url: url == freezed ? _value.url : url as String,
      urlToImage:
          urlToImage == freezed ? _value.urlToImage : urlToImage as String,
      publishedAt:
          publishedAt == freezed ? _value.publishedAt : publishedAt as DateTime,
      content: content == freezed ? _value.content : content as String,
    ));
  }
}

@JsonSerializable()
class _$_Article implements _Article {
  _$_Article(
      {@required this.source,
      this.author,
      @required this.title,
      @required this.description,
      @required this.url,
      this.urlToImage,
      @required this.publishedAt,
      this.content})
      : assert(source != null),
        assert(title != null),
        assert(description != null),
        assert(url != null),
        assert(publishedAt != null);

  factory _$_Article.fromJson(Map<String, dynamic> json) =>
      _$_$_ArticleFromJson(json);

  @override
  final Source source;
  @override
  final String author;
  @override
  final String title;
  @override
  final String description;
  @override
  final String url;
  @override
  final String urlToImage;
  @override
  final DateTime publishedAt;
  @override
  final String content;

  @override
  String toString() {
    return 'Article(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Article &&
            (identical(other.source, source) ||
                const DeepCollectionEquality().equals(other.source, source)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.urlToImage, urlToImage) ||
                const DeepCollectionEquality()
                    .equals(other.urlToImage, urlToImage)) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality()
                    .equals(other.publishedAt, publishedAt)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(source) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(urlToImage) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(content);

  @override
  _$ArticleCopyWith<_Article> get copyWith =>
      __$ArticleCopyWithImpl<_Article>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ArticleToJson(this);
  }
}

abstract class _Article implements Article {
  factory _Article(
      {@required Source source,
      String author,
      @required String title,
      @required String description,
      @required String url,
      String urlToImage,
      @required DateTime publishedAt,
      String content}) = _$_Article;

  factory _Article.fromJson(Map<String, dynamic> json) = _$_Article.fromJson;

  @override
  Source get source;
  @override
  String get author;
  @override
  String get title;
  @override
  String get description;
  @override
  String get url;
  @override
  String get urlToImage;
  @override
  DateTime get publishedAt;
  @override
  String get content;
  @override
  _$ArticleCopyWith<_Article> get copyWith;
}

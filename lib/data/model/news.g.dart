// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_News _$_$_NewsFromJson(Map<String, dynamic> json) {
  return _$_News(
    status: json['status'] as String,
    totalResults: json['totalResults'] as int,
    articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_NewsToJson(_$_News instance) => <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

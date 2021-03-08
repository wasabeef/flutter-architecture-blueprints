import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
abstract class News with _$News {
  factory News({
    required String status,
    required int totalResults,
    List<Article> articles,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}

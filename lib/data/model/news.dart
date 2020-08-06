import 'package:app/data/model/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  const News({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  final String status;
  final int totalResults;
  final List<Article> articles;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is News &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          totalResults == other.totalResults &&
          articles == other.articles;

  @override
  int get hashCode =>
      status.hashCode ^ totalResults.hashCode ^ articles.hashCode;

  @override
  String toString() {
    return 'News{status: $status, totalResults: $totalResults, articles: $articles}';
  }
}

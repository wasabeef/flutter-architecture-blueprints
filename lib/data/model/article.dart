import 'package:app/data/model/source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';

part 'article.g.dart';

@freezed
abstract class Article with _$Article {
  factory Article({
    @required Source source,
    @required String author,
    @required String title,
    @required String description,
    @required String url,
    String urlToImage,
    @required DateTime publishedAt,
    String content,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

import 'package:app/data/model/news.dart';
import 'package:app/data/model/result.dart';

abstract class NewsRepository {
  Future<Result<News>> getNews();
}

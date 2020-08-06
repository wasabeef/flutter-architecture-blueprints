import 'package:app/data/model/news.dart';

abstract class NewsRepository {
  Future<News> getNews();
}

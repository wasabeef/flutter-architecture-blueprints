import 'package:app/data/model/news.dart';

abstract class NewsDataSource {
  Future<News> getNews();
}

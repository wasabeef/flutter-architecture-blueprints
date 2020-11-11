import '../model/news.dart';

// ignore: one_member_abstracts
abstract class NewsDataSource {
  Future<News> getNews();
}

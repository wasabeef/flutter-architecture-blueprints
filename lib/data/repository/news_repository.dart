import '../model/news.dart';

// ignore: one_member_abstracts
abstract class NewsRepository {
  Future<News> getNews();
}

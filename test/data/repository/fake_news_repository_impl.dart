import 'package:app/data/model/news.dart';
import 'package:app/data/repository/news_repository.dart';

import '../dummy/dummy_news.dart';

class FakeNewsRepositoryImpl extends NewsRepository {
  @override
  Future<News> getNews() async {
    return dummyNews;
  }
}

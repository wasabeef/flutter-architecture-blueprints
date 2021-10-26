import 'package:app/data/model/news.dart';
import 'package:app/data/remote/news_data_source.dart';

import '../dummy/dummy_news.dart';

class FakeNewsDataSourceImpl implements NewsDataSource {
  @override
  Future<News> getNews({
    required String query,
    required String from,
    String? sortBy = 'publishedAt',
    String? language = 'en',
    required String apiKey,
  }) async {
    // TODO: implement getNews
    return dummyNews;
  }
}

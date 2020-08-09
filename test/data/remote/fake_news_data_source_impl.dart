import 'package:app/data/model/news.dart';
import 'package:app/data/remote/news_data_source.dart';

import '../dummy/dummy_news.dart';

class FakeNewsDataSourceImpl extends NewsDataSource {
  @override
  Future<News> getNews() async {
    return dummyNews;
  }
}

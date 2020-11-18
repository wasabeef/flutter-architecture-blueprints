import 'package:app/data/model/news.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/repository/news_repository.dart';

import '../dummy/dummy_news.dart';

class FakeNewsRepositoryImpl extends NewsRepository {
  @override
  Future<Result<News>> getNews() async {
    return Result.success(data: dummyNews);
  }
}

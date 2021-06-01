import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/news.dart';
import '../model/result.dart';
import '../provider/news_data_source_provider.dart';
import '../remote/news_data_source.dart';
import 'news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl(this._reader);

  final Reader _reader;

  late final NewsDataSource _dataSource = _reader(newsDataSourceProvider);

  @override
  Future<Result<News>> getNews() {
    return Result.guardFuture(_dataSource.getNews);
  }
}

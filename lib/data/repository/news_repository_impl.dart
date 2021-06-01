import 'package:app/data/model/news.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/provider/news_data_source_provider.dart';
import 'package:app/data/remote/news_data_source.dart';
import 'package:app/data/repository/news_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl(this._reader);

  final Reader _reader;

  late final NewsDataSource _dataSource = _reader(newsDataSourceProvider);

  @override
  Future<Result<News>> getNews() {
    return Result.guardFuture(_dataSource.getNews);
  }
}

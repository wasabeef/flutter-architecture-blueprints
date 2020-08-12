import 'package:app/data/repository/news_repository.dart';
import 'package:app/data/repository/news_repository_impl.dart';
import 'package:app/provier/news_data_source_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final Provider<NewsRepository> newsRepositoryProvider =
    Provider<NewsRepository>((ref) =>
        NewsRepositoryImpl(dataSource: ref.read(newsDataSourceProvider)));

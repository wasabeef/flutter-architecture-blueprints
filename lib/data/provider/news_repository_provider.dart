import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/news_repository.dart';
import '../repository/news_repository_impl.dart';
import 'news_data_source_provider.dart';

final newsRepositoryProvider = Provider<NewsRepository>(
    (ref) => NewsRepositoryImpl(dataSource: ref.read(newsDataSourceProvider)));

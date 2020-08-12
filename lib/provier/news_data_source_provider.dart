import 'package:app/data/remote/news_data_source.dart';
import 'package:app/data/remote/news_data_source_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'dio_provider.dart';

final Provider<NewsDataSource> newsDataSourceProvider =
    Provider<NewsDataSource>(
        (ref) => NewsDataSourceImpl(dio: ref.read(dioProvider)));

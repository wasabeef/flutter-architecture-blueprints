import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../remote/news_data_source.dart';
import '../remote/news_data_source_impl.dart';
import 'dio_provider.dart';

final newsDataSourceProvider = Provider<NewsDataSource>(
    (ref) => NewsDataSourceImpl(dio: ref.read(dioProvider)));

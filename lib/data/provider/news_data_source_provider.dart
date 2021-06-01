import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../remote/news_data_source.dart';
import '../remote/news_data_source_impl.dart';

final newsDataSourceProvider =
    Provider<NewsDataSource>((ref) => NewsDataSourceImpl(ref.read));

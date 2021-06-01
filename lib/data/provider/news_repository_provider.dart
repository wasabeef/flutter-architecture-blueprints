import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/news_repository.dart';
import '../repository/news_repository_impl.dart';

final newsRepositoryProvider =
    Provider<NewsRepository>((ref) => NewsRepositoryImpl(ref.read));

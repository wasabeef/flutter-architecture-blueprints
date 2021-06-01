import 'package:app/data/repository/news_repository.dart';
import 'package:app/data/repository/news_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final newsRepositoryProvider =
    Provider<NewsRepository>((ref) => NewsRepositoryImpl(ref.read));

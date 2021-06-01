import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/news.dart';
import '../../data/model/result.dart';
import '../../data/provider/news_repository_provider.dart';
import '../../data/repository/news_repository.dart';

final homeViewModelProvider =
    ChangeNotifierProvider((ref) => HomeViewModel(ref.read));

class HomeViewModel extends ChangeNotifier {
  final Reader _read;
  HomeViewModel(this._read);

  NewsRepository get _repository => _read(newsRepositoryProvider);

  // Result use case No.1
  Result<News>? _news;

  Result<News>? get news => _news;

  Future<void> fetchNews() {
    return _repository
        .getNews()
        .then((value) => _news = value)
        .whenComplete(notifyListeners);
  }
}

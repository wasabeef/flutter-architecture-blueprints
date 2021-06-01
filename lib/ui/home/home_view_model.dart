import 'package:app/data/model/news.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/provider/news_repository_provider.dart';
import 'package:app/data/repository/news_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider =
    ChangeNotifierProvider((ref) => HomeViewModel(ref.read));

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._reader);

  final Reader _reader;

  late final NewsRepository _repository = _reader(newsRepositoryProvider);

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

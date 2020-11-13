import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/app_error.dart';
import '../../data/model/news.dart';
import '../../data/provider/news_repository_provider.dart';
import '../../data/repository/news_repository.dart';
import '../change_notifier_with_error_handle.dart';

final homeViewModelNotifierProvider = ChangeNotifierProvider(
    (ref) => HomeViewModel(ref, repository: ref.read(newsRepositoryProvider)));

class HomeViewModel extends AppChangeNotifier {
  HomeViewModel(ProviderReference ref, {@required NewsRepository repository})
      : _repository = repository,
        super(ref);

  final NewsRepository _repository;

  News _news;

  News get news => _news;

  bool get hasArticle =>
      _news != null && _news.articles != null && _news.articles.isNotEmpty;

  Future<void> fetchNews() async {
    return _repository
        .getNews()
        .then((value) {
          doOnSuccess();
          _news = value;
        })
        .catchError((dynamic error) => doOnError(ApiError(error)))
        .whenComplete(notifyListeners);
  }
}

import 'package:app/data/app_error.dart';
import 'package:app/data/model/news.dart';
import 'package:app/data/provider/news_repository_provider.dart';
import 'package:app/data/repository/news_repository.dart';
import 'package:app/ui/change_notifier_with_error_handle.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelNotifierProvider = ChangeNotifierProvider(
    (ref) => HomeViewModel(ref, repository: ref.read(newsRepositoryProvider)));

class HomeViewModel extends AppChangeNotifier {
  HomeViewModel(ProviderReference ref, {@required NewsRepository repository})
      : _repository = repository,
        super(ref);

  final NewsRepository _repository;

  News _news;

  News get news => _news;

  Future<void> fetchNews() async {
    return _repository
        .getNews()
        .then((value) {
          doOnSuccess();
          _news = value;
        })
        .catchError((dynamic error) => doOnError(AppError(error)))
        .whenComplete(() => notifyListeners());
  }
}

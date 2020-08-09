import 'package:app/data/model/news.dart';
import 'package:app/data/provier/news_repository_provider.dart';
import 'package:app/data/repository/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelNotifierProvider = ChangeNotifierProvider(
    (ref) => HomeViewModel(repository: ref.read(newsRepositoryProvider)));

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({@required NewsRepository repository})
      : _repository = repository;

  final NewsRepository _repository;

  News _news;

  News get news => _news;

  Future<News> getNews() async {
    return _repository
        .getNews()
        .then((value) => _news = value)
        .whenComplete(() => notifyListeners());
  }
}

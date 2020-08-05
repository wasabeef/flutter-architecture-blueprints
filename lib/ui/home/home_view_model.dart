import 'package:app/data/remote/app_dio.dart';
import 'package:app/data/remote/news_data_source_impl.dart';
import 'package:app/data/repository/news_repository.dart';
import 'package:app/data/repository/news_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// TODO(wasabeef): thinking thinking.. where should write this code.
final dataSource = NewsDataSourceImpl(dio: AppDio());
final repository = NewsRepositoryImpl(dataSource: dataSource);
final homeViewModelNotifierProvider =
    ChangeNotifierProvider((_) => HomeViewModel(repository: repository));

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({@required NewsRepository repository})
      : _repository = repository;

  final NewsRepository _repository;

  String news = 'Not yet';

  Future<String> getNews() async {
    return _repository
        .getNews()
        .then((value) => news = value)
        .whenComplete(() => notifyListeners());
  }
}

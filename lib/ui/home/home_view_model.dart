import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/news.dart';
import '../../data/provider/news_repository_provider.dart';
import '../../data/repository/news_repository.dart';
import '../app_change_notifier.dart';

final homeViewModelNotifierProvider = ChangeNotifierProvider(
    (ref) => HomeViewModel(ref.read(newsRepositoryProvider)));

class HomeViewModel extends AppChangeNotifier {
  HomeViewModel(this._repository);

  final NewsRepository _repository;

  News _news;

  News get news => _news;

  bool get hasArticle =>
      _news != null && _news.articles != null && _news.articles.isNotEmpty;

  Future<void> fetchNews() async {
    return _repository
        .getNews()
        .then((value) => _news = value)
        .catchError((e) => error = e)
        .whenComplete(notifyListeners);
  }
}

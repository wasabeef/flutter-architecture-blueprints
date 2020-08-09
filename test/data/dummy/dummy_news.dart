import 'package:app/data/model/article.dart';
import 'package:app/data/model/news.dart';

import 'dummy_article.dart';

final dummyNews = News(status: 'success', totalResults: 5, articles: <Article>[
  dummyArticle,
  dummyArticle,
  dummyArticle,
  dummyArticle,
  dummyArticle
]);

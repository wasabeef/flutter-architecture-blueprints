import 'package:flutter/material.dart';

import '../model/news.dart';
import '../remote/news_data_source.dart';
import 'news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl({@required NewsDataSource dataSource})
      : _dataSource = dataSource;

  final NewsDataSource _dataSource;

  @override
  Future<News> getNews() async {
    return _dataSource.getNews();
  }
}

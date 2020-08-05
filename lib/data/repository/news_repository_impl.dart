import 'package:app/data/remote/news_data_source.dart';
import 'package:app/data/repository/news_repository.dart';
import 'package:flutter/material.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl({@required NewsDataSource dataSource})
      : _dataSource = dataSource;

  final NewsDataSource _dataSource;

  @override
  Future<String> getNews() async {
    return _dataSource.getNews();
  }
}

import 'package:flutter/material.dart';

import '../app_error.dart';
import '../model/news.dart';
import '../model/result.dart';
import '../remote/news_data_source.dart';
import 'news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl({@required NewsDataSource dataSource})
      : _dataSource = dataSource;

  final NewsDataSource _dataSource;

  @override
  Future<Result<News>> getNews() async {
    try {
      return Result.success(data: await _dataSource.getNews());
    } on Exception catch (e) {
      return Result.failure(error: AppError(e));
    }
  }
}

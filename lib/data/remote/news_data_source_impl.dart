import 'package:app/data/model/news.dart';
import 'package:app/data/remote/news_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NewsDataSourceImpl implements NewsDataSource {
  NewsDataSourceImpl({@required Dio dio}) : _dio = dio;

  // ignore: unused_field
  final Dio _dio;

  @override
  Future<News> getNews() async {
    return _dio
        .get<Map<String, dynamic>>(
            '/v2/everything?q=bitcoin&from=2020-07-06&sortBy=publishedAt&apiKey=4bc454db94464956aea4cbb01f4bf9f4')
        .then((response) => News.fromJson(response.data));
  }
}

import 'package:app/data/remote/news_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NewsDataSourceImpl implements NewsDataSource {
  NewsDataSourceImpl({@required Dio dio}) : _dio = dio;

  // ignore: unused_field
  final Dio _dio;

  @override
  Future<String> getNews() async {
    // TODO(wasabeef): fix API call
    return 'NewsNewsNews';
  }
}

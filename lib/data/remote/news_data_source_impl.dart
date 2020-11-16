import 'dart:math';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';

import '../../constants.dart';
import '../../util/ext/date_time.dart';
import '../model/news.dart';
import 'news_data_source.dart';

class NewsDataSourceImpl implements NewsDataSource {
  NewsDataSourceImpl({@required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<News> getNews() async {
    return _dio.get<Map<String, dynamic>>(
      '/v2/everything',
      queryParameters: <String, String>{
        'q': ['anim', 'manga'][Random().nextInt(2)], // For checking reload.
        'from': DateTime.now()
            .subtract(
              const Duration(days: 28),
            )
            .toLocal()
            .formatYYYYMMdd(),
        'sortBy': 'publishedAt',
        'language': 'en',
        'apiKey': Constants.of().apiKey,
      },
      options: buildCacheOptions(const Duration(seconds: 5)),
    ).then((response) => News.fromJson(response.data));
  }
}

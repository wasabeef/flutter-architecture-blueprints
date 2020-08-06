import 'package:app/constants.dart';
import 'package:app/data/model/news.dart';
import 'package:app/data/remote/news_data_source.dart';
import 'package:app/util/ext/date_time.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';

class NewsDataSourceImpl implements NewsDataSource {
  NewsDataSourceImpl({@required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<News> getNews() async {
    return _dio
        .get<Map<String, dynamic>>('/v2/everything',
            queryParameters: <String, String>{
              'q': 'flutter+dart',
              'from': DateTime.now()
                  .subtract(
                    const Duration(days: 28),
                  )
                  .toLocal()
                  .formatYYYYMMdd(),
              'sortBy': 'publishedAt',
              'apiKey': Constants.of().apiKey,
            },
            options: buildCacheOptions(const Duration(hours: 1)))
        .then((response) => News.fromJson(response.data));
  }
}

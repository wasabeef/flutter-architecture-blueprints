import 'dart:math';

import 'package:app/constants.dart';
import 'package:app/data/model/news.dart';
import 'package:app/data/provider/dio_provider.dart';
import 'package:app/data/remote/news_data_source.dart';
import 'package:app/foundation/extension/date_time.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsDataSourceImpl implements NewsDataSource {
  NewsDataSourceImpl(this._reader);

  final Reader _reader;

  late final Dio _dio = _reader(dioProvider);

  @override
  Future<News> getNews() {
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
    ).then((response) => News.fromJson(response.data!));
  }
}

import 'package:app/data/model/news.dart';
import 'package:app/data/remote/app_dio.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'news_data_source.g.dart';

final newsDataSourceProvider = Provider((ref) => NewsDataSource(ref.read));

@RestApi()
abstract class NewsDataSource {
  factory NewsDataSource(Reader reader) => _NewsDataSource(reader(dioProvider));

  @GET('/v2/everything')
  Future<News> getNews({
    @Query("q") required String query,
    @Query("from") required String from,
    @Query("sortBy") String? sortBy = 'publishedAt',
    @Query("language") String? language = 'en',
    @Query("apiKey") required String apiKey,
  });
}

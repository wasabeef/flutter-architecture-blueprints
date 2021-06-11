// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NewsDataSource implements NewsDataSource {
  _NewsDataSource(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<News> getNews(
      {required query,
      required from,
      sortBy = 'publishedAt',
      language = 'en',
      required apiKey}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'q': query,
      r'from': from,
      r'sortBy': sortBy,
      r'language': language,
      r'apiKey': apiKey
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<News>(
        Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/v2/everything',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = News.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

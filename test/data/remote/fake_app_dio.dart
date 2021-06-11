import 'dart:convert';

import 'package:app/data/remote/app_dio.dart';
import 'package:dio/dio.dart';

import '../dummy/dummy_response_news_api.dart';

class FakeAppDio implements AppDio {
  @override
  BaseOptions get options => BaseOptions();

  @override
  Future<Response<T>> fetch<T>(RequestOptions requestOptions) async {
    if (requestOptions.path.contains('/v2/everything')) {
      return FakeResponse(
              json.decode(dummyResponseNewsApi) as Map<String, dynamic>?)
          as Response<T>;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  void noSuchMethod(Invocation invocation) {
    throw UnimplementedError();
  }
}

class FakeResponse implements Response<Map<String, dynamic>> {
  FakeResponse(this.data);

  @override
  final Map<String, dynamic>? data;

  @override
  void noSuchMethod(Invocation invocation) {
    throw UnimplementedError();
  }
}

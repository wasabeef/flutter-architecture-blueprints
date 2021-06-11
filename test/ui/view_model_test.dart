import 'package:app/data/model/result.dart';
import 'package:app/data/remote/app_dio.dart';
import 'package:app/data/remote/news_data_source.dart';
import 'package:app/data/repository/news_repository_impl.dart';
import 'package:app/foundation/constants.dart';
import 'package:app/ui/news/news_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../data/dummy/dummy_news.dart';
import '../data/remote/fake_app_dio.dart';
import '../data/remote/fake_news_data_source_impl.dart';
import '../data/repository/fake_news_repository_impl.dart';

class MockNewsRepositoryImpl extends Mock implements NewsRepositoryImpl {}

void main() {
  test('HomeViewModel Test', () async {
    final container = ProviderContainer(
      overrides: [
        newsRepositoryProvider.overrideWithValue(FakeNewsRepositoryImpl())
      ],
    );
    final viewModel = container.read(newsViewModelProvider);
    await expectLater(
        viewModel.fetchNews(), completion(Result.success(data: dummyNews)));
  });

  test('NewsRepository Test', () async {
    final container = ProviderContainer(
      overrides: [
        newsDataSourceProvider.overrideWithValue(FakeNewsDataSourceImpl())
      ],
    );
    final newsRepository = container.read(newsRepositoryProvider);
    await expectLater(
        newsRepository.getNews(), completion(Result.success(data: dummyNews)));
  });

  test('NewsDataSource Test', () async {
    final container = ProviderContainer(
      overrides: [dioProvider.overrideWithValue(FakeAppDio())],
    );
    final dataSource = container.read(newsDataSourceProvider);
    await expectLater(
        dataSource.getNews(
          apiKey: 'apikey',
          from: 'from',
          query: 'query',
        ),
        completion(isNotNull));
  });

  test('AppDio options Test', () async {
    final realDio = AppDio.getInstance();
    expect(realDio.options.baseUrl, Constants.of().endpoint);
    expect(realDio.options.contentType, 'application/json');
    expect(realDio.options.connectTimeout, 30000);
    expect(realDio.options.sendTimeout, 30000);
    expect(realDio.options.receiveTimeout, 30000);
  });
}

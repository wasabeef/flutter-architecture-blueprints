import 'package:app/foundation/constants.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/provider/dio_provider.dart';
import 'package:app/data/provider/news_data_source_provider.dart';
import 'package:app/data/provider/news_repository_provider.dart';
import 'package:app/data/remote/app_dio.dart';
import 'package:app/ui/home/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/dummy/dummy_news.dart';
import '../data/remote/fake_app_dio.dart';
import '../data/remote/fake_news_data_source_impl.dart';
import '../data/repository/fake_news_repository_impl.dart';

void main() {
  test('HomeViewModel Test', () async {
    final container = ProviderContainer(
      overrides: [
        newsRepositoryProvider.overrideWithValue(FakeNewsRepositoryImpl())
      ],
    );
    final viewModel = container.read(homeViewModelProvider);
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
    await expectLater(dataSource.getNews(), completion(isNotNull));
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

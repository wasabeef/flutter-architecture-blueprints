import 'package:app/data/provier/dio_provider.dart';
import 'package:app/data/provier/news_data_source_provider.dart';
import 'package:app/data/provier/news_repository_provider.dart';
import 'package:app/ui/home/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'data/dummy/dummy_news.dart';
import 'data/remote/fake_app_dio.dart';
import 'data/remote/fake_news_data_source_impl.dart';
import 'data/repository/fake_news_repository_impl.dart';

void main() {
  test('HomeViewModel Test', () async {
    final container = ProviderContainer(
      overrides: [
        newsRepositoryProvider.overrideWithValue(FakeNewsRepositoryImpl())
      ],
    );
    final viewModel = container.read(homeViewModelNotifierProvider);
    await expectLater(viewModel.getNews(), completion(dummyNews));
  });

  test('NewsRepository Test', () async {
    final container = ProviderContainer(
      overrides: [
        newsDataSourceProvider.overrideWithValue(FakeNewsDataSourceImpl())
      ],
    );
    final newsRepository = container.read(newsRepositoryProvider);
    await expectLater(newsRepository.getNews(), completion(dummyNews));
  });

  test('NewsDataSource Test', () async {
    final container = ProviderContainer(
      overrides: [dioProvider.overrideWithValue(FakeAppDio())],
    );
    final dataSource = container.read(newsDataSourceProvider);
    expect(dataSource.getNews(), isNotNull);
  });
}

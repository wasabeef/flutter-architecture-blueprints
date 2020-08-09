import 'package:app/ui/component/article_item.dart';
import 'package:app/ui/component/loading.dart';
import 'package:app/ui/detail/datail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:mockito/mockito.dart';

import 'data/dummy/dummy_article.dart';

mixin MockDetailPage implements Mock, DetailPage {}

void main() {
  testWidgets('Article widget test', (WidgetTester tester) async {
    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: ArticleItem(
            article: dummyArticle,
          ),
        ),
      ));
    });
  });
  testWidgets('Loading widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const Loading());
  });
}

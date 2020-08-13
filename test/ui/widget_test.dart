import 'package:app/app.dart';
import 'package:app/data/app_error.dart';
import 'package:app/data/model/theme_setting.dart';
import 'package:app/l10n/delegate.dart';
import 'package:app/ui/app_theme.dart';
import 'package:app/ui/component/article_item.dart';
import 'package:app/ui/component/loading.dart';
import 'package:app/ui/detail/datail_page.dart';
import 'package:app/ui/error_notifier.dart';
import 'package:app/ui/home/home_page.dart';
import 'package:app/ui/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:mockito/mockito.dart';

import '../data/dummy/dummy_article.dart';

class MockAppTheme extends Mock implements AppTheme {}

class MockErrorNotifier extends Mock implements ErrorNotifier {}

class MockHomeViewModel extends Mock implements HomeViewModel {}

void main() {
  final mockErrorNotifier = MockErrorNotifier();
  when(mockErrorNotifier.hasBeenHandled).thenReturn(true);
  when(mockErrorNotifier.getErrorIfNotHandled()).thenReturn(AppError(Error()));

  final mockAppTheme = MockAppTheme();
  when(mockAppTheme.setting).thenReturn(ThemeSetting.LIGHT);
  when(mockAppTheme.themeData).thenAnswer((_) => Future.value(lightTheme));

  testWidgets('App widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appThemeNotifierProvider.overrideWithValue(mockAppTheme),
        ],
        child: Builder(
          builder: (context) {
            return App();
          },
        ),
      ),
    );
  });

  testWidgets('HomePage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          errorNotifierProvider.overrideWithValue(mockErrorNotifier),
          appThemeNotifierProvider.overrideWithValue(mockAppTheme),
          homeViewModelNotifierProvider.overrideWithValue(MockHomeViewModel())
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp(
              home: HomePage(),
              localizationsDelegates: const [
                L10nDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''),
                Locale('ja', ''),
              ],
            );
          },
        ),
      ),
    );
  });

  testWidgets('DetailPage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: DetailPage(),
      localizationsDelegates: const [
        L10nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ja', ''),
      ],
    ));
  });

  testWidgets('HomePage widget test', (WidgetTester tester) async {
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
  testWidgets('HomePage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const Loading());
  });
}

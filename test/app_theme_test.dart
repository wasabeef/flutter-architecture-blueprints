import 'package:app/data/model/theme_setting.dart';
import 'package:app/data/provier/theme_data_source_provider.dart';
import 'package:app/data/provier/theme_repository_provider.dart';
import 'package:app/ui/app_theme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';

import 'data/local/fake_theme_data_source_impl.dart';
import 'data/repository/fake_theme_repository_impl.dart';

class MockAppTheme extends Mock implements AppTheme {}

void main() {
  test('AppTheme + ThemeRepository Test', () async {
    final container = ProviderContainer(
      overrides: [
        themeRepositoryProvider
            .overrideWithValue(AsyncValue.data(FakeThemeRepositoryImpl())),
      ],
    );
    final appTheme = container.read(appThemeNotifierProvider);
    await expectLater(appTheme.themeData, completion(darkTheme));
    expect(appTheme.setting, ThemeSetting.DARK);

    await appTheme.toggle();

    await expectLater(appTheme.themeData, completion(lightTheme));
    expect(appTheme.setting, ThemeSetting.LIGHT);
  });

  test('AppTheme + DataSource Test', () async {
    final container = ProviderContainer(
      overrides: [
        themeDataSourceProvider
            .overrideWithValue(AsyncValue.data(FakeThemeDataSourceImpl())),
      ],
    );
    final appTheme = container.read(appThemeNotifierProvider);
    await expectLater(appTheme.themeData, completion(darkTheme));
    expect(appTheme.setting, ThemeSetting.DARK);

    await appTheme.toggle();

    await expectLater(appTheme.themeData, completion(lightTheme));
    expect(appTheme.setting, ThemeSetting.LIGHT);
  });
}

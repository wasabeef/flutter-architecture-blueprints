import 'package:app/ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockAppTheme extends Mock implements AppTheme {}

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues(
        <String, String>{'theme_mode': 'dark'});
  });

  test('AppTheme + ThemeRepository Test', () async {
    final container = ProviderContainer(
      overrides: [
        // or use SharedPreferences.setMockInitialValues
        // themeDataSourceProvider
        //    .overrideWithValue(AsyncValue.data(FakeThemeDataSourceImpl())),
      ],
    );
    final appTheme = container.read(appThemeNotifierProvider);
    await expectLater(appTheme.themeMode, completion(ThemeMode.dark));
    expect(appTheme.setting, ThemeMode.dark);

    await appTheme.toggle();

    await expectLater(appTheme.themeMode, completion(ThemeMode.light));
    expect(appTheme.setting, ThemeMode.light);
  });
}

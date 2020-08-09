import 'package:app/data/model/theme_setting.dart';
import 'package:app/ui/app_theme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockAppTheme extends Mock implements AppTheme {}

void main() {
  setUpAll(() async {
    SharedPreferences.setMockInitialValues(
        <String, String>{'theme_setting': 'dark'});
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
    await expectLater(appTheme.themeData, completion(darkTheme));
    expect(appTheme.setting, ThemeSetting.DARK);

    await appTheme.toggle();

    await expectLater(appTheme.themeData, completion(lightTheme));
    expect(appTheme.setting, ThemeSetting.LIGHT);
  });
}

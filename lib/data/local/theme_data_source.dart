import 'package:app/data/local/theme_setting.dart';

abstract class ThemeDataSource {
  ThemeSetting loadThemeSetting();

  Future<void> saveThemeSetting(ThemeSetting theme);
}

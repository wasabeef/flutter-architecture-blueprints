import 'package:app/data/local/theme_setting.dart';

abstract class ThemeRepository {
  ThemeSetting loadThemeSetting();

  Future<void> saveThemeSetting(ThemeSetting theme);
}

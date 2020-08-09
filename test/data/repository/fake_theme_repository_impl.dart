import 'package:app/data/model/theme_setting.dart';
import 'package:app/data/repository/theme_repository.dart';

class FakeThemeRepositoryImpl extends ThemeRepository {
  @override
  ThemeSetting loadThemeSetting() {
    return ThemeSetting.DARK;
  }

  @override
  Future<void> saveThemeSetting(ThemeSetting theme) async {
    // no-op
  }
}

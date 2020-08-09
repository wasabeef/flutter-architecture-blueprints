import 'package:app/data/local/theme_data_source.dart';
import 'package:app/data/model/theme_setting.dart';

class FakeThemeDataSourceImpl extends ThemeDataSource {
  @override
  ThemeSetting loadThemeSetting() {
    return ThemeSetting.DARK;
  }

  @override
  Future<void> saveThemeSetting(ThemeSetting theme) async {
    // no-op
  }
}

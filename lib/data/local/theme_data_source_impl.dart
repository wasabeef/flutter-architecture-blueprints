import 'package:app/data/local/theme_data_source.dart';
import 'package:app/data/model/theme_setting.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeDataSourceImpl extends ThemeDataSource {
  ThemeDataSourceImpl({@required SharedPreferences prefs}) : _prefs = prefs;

  static const String KEY_THEME_SETTING = 'theme_setting';

  final SharedPreferences _prefs;

  @override
  ThemeSetting loadThemeSetting() {
    return EnumToString.fromString(
        ThemeSetting.values, _prefs.getString(KEY_THEME_SETTING));
  }

  @override
  Future<void> saveThemeSetting(ThemeSetting theme) {
    return _prefs.setString(KEY_THEME_SETTING, EnumToString.parse(theme));
  }
}

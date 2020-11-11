import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/theme_setting.dart';
import 'theme_data_source.dart';

class ThemeDataSourceImpl extends ThemeDataSource {
  ThemeDataSourceImpl({@required SharedPreferences prefs}) : _prefs = prefs;

  static const String keyThemeSetting = 'theme_setting';

  final SharedPreferences _prefs;

  @override
  ThemeSetting loadThemeSetting() {
    return EnumToString.fromString(
        ThemeSetting.values, _prefs.getString(keyThemeSetting));
  }

  @override
  Future<void> saveThemeSetting(ThemeSetting theme) {
    return _prefs.setString(
        keyThemeSetting, EnumToString.convertToString(theme));
  }
}

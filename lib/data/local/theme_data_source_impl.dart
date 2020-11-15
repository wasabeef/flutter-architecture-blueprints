import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_data_source.dart';

class ThemeDataSourceImpl extends ThemeDataSource {
  ThemeDataSourceImpl({@required SharedPreferences prefs}) : _prefs = prefs;

  static const String keyThemeMode = 'theme_mode';

  final SharedPreferences _prefs;

  @override
  ThemeMode loadThemeMode() {
    return EnumToString.fromString(
        ThemeMode.values, _prefs.getString(keyThemeMode));
  }

  @override
  Future<void> saveThemeMode(ThemeMode theme) {
    return _prefs.setString(keyThemeMode, EnumToString.convertToString(theme));
  }
}

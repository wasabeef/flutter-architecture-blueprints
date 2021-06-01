import 'package:app/data/local/app_shared_preferences.dart';
import 'package:app/data/local/theme_data_source.dart';
import 'package:app/data/provider/app_shared_preferences_provider.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeDataSourceImpl extends ThemeDataSource {
  ThemeDataSourceImpl(this._reader);

  static const String keyThemeMode = 'theme_mode';

  final Reader _reader;
  late final AppSharedPreferences _prefs = _reader(prefsProvider);

  @override
  Future<ThemeMode?> loadThemeMode() async {
    final prefs = await _prefs.getInstance();
    return EnumToString.fromString(
        ThemeMode.values, prefs.getString(keyThemeMode)!);
  }

  @override
  Future<void> saveThemeMode(ThemeMode? theme) async {
    final prefs = await _prefs.getInstance();
    prefs.setString(keyThemeMode, EnumToString.convertToString(theme));
  }
}

import 'package:app/data/local/theme_data_source.dart';
import 'package:flutter/material.dart';

class FakeThemeDataSourceImpl extends ThemeDataSource {
  @override
  ThemeMode loadThemeMode() {
    return ThemeMode.dark;
  }

  @override
  Future<void> saveThemeMode(ThemeMode theme) async {
    // no-op
  }
}

import 'package:flutter/material.dart';

abstract class ThemeDataSource {
  ThemeMode loadThemeMode();

  Future<void> saveThemeMode(ThemeMode theme);
}

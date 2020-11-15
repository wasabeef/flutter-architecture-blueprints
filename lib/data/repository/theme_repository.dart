import 'package:flutter/material.dart';

abstract class ThemeRepository {
  ThemeMode loadThemeMode();

  Future<void> saveThemeMode(ThemeMode theme);
}

import 'package:flutter/material.dart';

abstract class ThemeRepository {
  Future<ThemeMode> loadThemeMode();

  Future<void> saveThemeMode(ThemeMode theme);
}

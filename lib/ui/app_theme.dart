import 'package:app/data/local/theme_setting.dart';
import 'package:app/data/provier/theme_repository_provider.dart';
import 'package:app/data/repository/theme_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final appThemeNotifierProvider =
    StateNotifierProvider<AppTheme>((ref) => AppTheme(ref));

ThemeData get lightTheme {
  return ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData get darkTheme {
  return ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

class AppTheme extends StateNotifier<ThemeData> {
  AppTheme(this._ref) : super(darkTheme) {
    _loadThemeSetting();
  }

  final ProviderReference _ref;

  ThemeRepository _repository;

  ThemeSetting _theme;

  Future<void> _loadThemeSetting() async {
    _repository ??= await _ref.read(themeRepositoryProvider.future);
    _theme = _repository.loadThemeSetting() ?? ThemeSetting.DARK;
    return changeTheme(_theme);
  }

  Future<void> changeTheme(ThemeSetting theme) {
    theme == ThemeSetting.LIGHT ? _loadLightTheme() : _loadDarkTheme();
    return _repository.saveThemeSetting(theme);
  }

  Future<void> _loadLightTheme() async {
    _repository ??= await _ref.read(themeRepositoryProvider.future);
    _theme = ThemeSetting.LIGHT;
    state = lightTheme;
  }

  Future<void> _loadDarkTheme() async {
    _repository ??= await _ref.read(themeRepositoryProvider.future);
    _theme = ThemeSetting.DARK;
    state = darkTheme;
  }

  Future<void> toggle() async {
    _theme =
        _theme == ThemeSetting.LIGHT ? ThemeSetting.DARK : ThemeSetting.LIGHT;
    return changeTheme(_theme);
  }
}

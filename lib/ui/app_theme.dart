import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/provider/theme_repository_provider.dart';
import '../data/repository/theme_repository.dart';
import '../gen/fonts.gen.dart';

// Color converter: https://www.w3schools.com/colors/colors_converter.asp
// Transparency list
// 100% FF
// 95%  F2
// 90%  E6
// 87%  DE
// 85%  D9
// 80%  CC
// 75%  BF
// 70%  B3
// 65%  A6
// 60%  99
// 55%  8C
// 54%  8A
// 50%  80
// 45%  73
// 40%  66
// 35%  59
// 32%  52
// 30%  4D
// 26%  42
// 25%  40
// 20%  33
// 16%  29
// 15%  26
// 12%  1F
// 10%  1A
// 5%   0D
// 0%   00

final appThemeNotifierProvider = ChangeNotifierProvider<AppTheme>(
    (ref) => AppTheme(ref.read(themeRepositoryProvider)));

const headline1 = TextStyle(
  fontSize: 24,
  fontFamily: FontFamily.rotunda,
  fontWeight: FontWeight.bold,
);

const buttonTextStyle = TextStyle(
  fontSize: 24,
  color: Colors.white,
  fontFamily: FontFamily.rotunda,
  fontWeight: FontWeight.bold,
);

const accentColor = Color(0xff17c063);
const errorColor = Color(0xffff5544);

ThemeData get lightTheme {
  return ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme:
        GoogleFonts.notoSansTextTheme(ThemeData.light().textTheme).copyWith(
      headline1: headline1,
      button: buttonTextStyle,
    ),
    accentColor: accentColor,
    errorColor: errorColor,
  );
}

ThemeData get darkTheme {
  return ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme:
        GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme).copyWith(
      headline1: headline1,
      button: buttonTextStyle,
    ),
    accentColor: accentColor,
    errorColor: errorColor,
  );
}

class AppTheme extends ChangeNotifier {
  AppTheme(this._repository);

  static const _defaultThemeMode = ThemeMode.light;

  final ThemeRepository _repository;

  ThemeMode _setting = _defaultThemeMode;

  ThemeMode get setting => _setting;

  Future<ThemeMode?> themeMode() async {
    _setting = await _repository.loadThemeMode() ?? _defaultThemeMode;
    return setting;
  }

  Future<void> _loadLightMode() async {
    _setting = ThemeMode.light;
    await _repository.saveThemeMode(setting).whenComplete(notifyListeners);
  }

  Future<void> _loadDarkMode() async {
    _setting = ThemeMode.dark;
    await _repository.saveThemeMode(setting).whenComplete(notifyListeners);
  }

  Future<void> toggle() async {
    setting == ThemeMode.light ? await _loadDarkMode() : await _loadLightMode();
  }
}

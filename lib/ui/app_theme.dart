import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/provider/theme_repository_provider.dart';
import '../data/repository/theme_repository.dart';
import 'change_notifier_with_error_handle.dart';

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

final appThemeNotifierProvider =
    ChangeNotifierProvider<AppTheme>((ref) => AppTheme(ref));

ThemeData get lightTheme {
  return ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.notoSansTextTheme(ThemeData.light().textTheme),
    errorColor: Color(0xffff5544),
  );
}

ThemeData get darkTheme {
  return ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme),
    errorColor: Color(0xffff5544),
  );
}

class AppTheme extends AppChangeNotifier {
  AppTheme(ProviderReference ref)
      : _ref = ref,
        super(ref);

  static const _defaultThemeMode = ThemeMode.light;

  final ProviderReference _ref;

  ThemeRepository _repository;

  ThemeMode _setting;

  ThemeMode get setting => _setting;

  Future<ThemeMode> get themeMode async {
    if (setting == null) {
      _repository ??= await _ref.read(themeRepositoryProvider.future);
      _setting = _repository.loadThemeMode() ?? _defaultThemeMode;
    }
    return setting;
  }

  Future<void> _loadLightMode() async {
    _repository ??= await _ref.read(themeRepositoryProvider.future);
    _setting = ThemeMode.light;
    await _repository.saveThemeMode(setting).whenComplete(notifyListeners);
  }

  Future<void> _loadDarkMode() async {
    _repository ??= await _ref.read(themeRepositoryProvider.future);
    _setting = ThemeMode.dark;
    await _repository.saveThemeMode(setting).whenComplete(notifyListeners);
  }

  Future<void> toggle() async {
    setting == ThemeMode.light ? await _loadDarkMode() : await _loadLightMode();
  }
}

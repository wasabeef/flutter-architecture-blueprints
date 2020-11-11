import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/app_error.dart';
import '../data/model/theme_setting.dart';
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
  );
}

ThemeData get darkTheme {
  return ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme),
  );
}

class AppTheme extends AppChangeNotifier {
  AppTheme(ProviderReference ref)
      : _ref = ref,
        super(ref);

  static const _defaultThemeSetting = ThemeSetting.light;

  final ProviderReference _ref;

  ThemeRepository _repository;

  ThemeSetting _setting;

  ThemeSetting get setting => _setting;

  Future<ThemeData> get themeData async {
    if (setting == null) {
      _repository ??= await _ref.read(themeRepositoryProvider.future);
      _setting = _repository.loadThemeSetting() ?? _defaultThemeSetting;
    }
    return setting == ThemeSetting.light ? lightTheme : darkTheme;
  }

  Future<void> _loadLightTheme() async {
    _repository ??= await _ref.read(themeRepositoryProvider.future);
    _setting = ThemeSetting.light;
    await _repository
        .saveThemeSetting(setting)
        .catchError((dynamic error) => doOnError(AppError(error)));
    notifyListeners();
  }

  Future<void> _loadDarkTheme() async {
    _repository ??= await _ref.read(themeRepositoryProvider.future);
    _setting = ThemeSetting.dark;
    await _repository
        .saveThemeSetting(setting)
        .catchError((dynamic error) => doOnError(AppError(error)));
    notifyListeners();
  }

  Future<void> toggle() async {
    setting == ThemeSetting.light
        ? await _loadDarkTheme()
        : await _loadLightTheme();
  }
}

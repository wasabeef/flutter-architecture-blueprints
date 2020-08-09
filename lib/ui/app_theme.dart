import 'package:app/data/app_error.dart';
import 'package:app/data/model/theme_setting.dart';
import 'package:app/data/provier/theme_repository_provider.dart';
import 'package:app/data/repository/theme_repository.dart';
import 'package:app/ui/change_notifier_with_error_handle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

  static const _DEFAULT_THEME_SETTING = ThemeSetting.LIGHT;

  final ProviderReference _ref;

  ThemeRepository _repository;

  ThemeSetting _setting;

  ThemeSetting get setting => _setting;

  Future<ThemeData> get themeData async {
    if (setting == null) {
      _repository ??= await _ref.read(themeRepositoryProvider.future);
      _setting = _repository.loadThemeSetting() ?? _DEFAULT_THEME_SETTING;
    }
    return setting == ThemeSetting.LIGHT ? lightTheme : darkTheme;
  }

  Future<void> _loadLightTheme() async {
    _repository ??= await _ref.read(themeRepositoryProvider.future);
    _setting = ThemeSetting.LIGHT;
    await _repository
        .saveThemeSetting(setting)
        .catchError((dynamic error) => doOnError(AppError(error)));
    notifyListeners();
  }

  Future<void> _loadDarkTheme() async {
    _repository ??= await _ref.read(themeRepositoryProvider.future);
    _setting = ThemeSetting.DARK;
    await _repository
        .saveThemeSetting(setting)
        .catchError((dynamic error) => doOnError(AppError(error)));
    notifyListeners();
  }

  Future<void> toggle() async {
    setting == ThemeSetting.LIGHT
        ? await _loadDarkTheme()
        : await _loadLightTheme();
  }
}

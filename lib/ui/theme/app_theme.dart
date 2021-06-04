import 'package:app/ui/theme/app_colors.dart';
import 'package:app/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

export 'package:app/ui/theme/app_text_theme.dart' show TextStyleExt;

final appThemeModeProvider =
    StateNotifierProvider<StateController<ThemeMode>, ThemeMode>(
  (ref) => StateController(ThemeMode.dark),
);

final appThemeProvider = Provider<AppTheme>(
  (ref) {
    final mode = ref.watch(appThemeModeProvider);
    switch (mode) {
      case ThemeMode.dark:
        return AppTheme.dark();
      case ThemeMode.light:
      default:
        return AppTheme.light();
    }
  },
);

class AppTheme {
  AppTheme({
    required this.mode,
    required this.data,
    required this.textTheme,
    required this.appColors,
  });

  factory AppTheme.light() {
    final mode = ThemeMode.light;
    final appColors = AppColors.light();
    final themeData = ThemeData.light().copyWith(
      scaffoldBackgroundColor: appColors.background,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: appColors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      textTheme: AppTextTheme(),
      appColors: appColors,
    );
  }

  factory AppTheme.dark() {
    final mode = ThemeMode.dark;
    final appColors = AppColors.dark();
    final themeData = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: appColors.background,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: appColors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      textTheme: AppTextTheme(),
      appColors: appColors,
    );
  }

  final ThemeMode mode;
  final ThemeData data;
  final AppTextTheme textTheme;
  final AppColors appColors;
}

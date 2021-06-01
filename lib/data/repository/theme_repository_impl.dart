import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../local/theme_data_source.dart';
import '../provider/theme_data_source_provider.dart';
import 'theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  ThemeRepositoryImpl(this._reader);

  final Reader _reader;

  late final ThemeDataSource _dataSource = _reader(themeDataSourceProvider);

  @override
  Future<ThemeMode?> loadThemeMode() {
    return _dataSource.loadThemeMode();
  }

  @override
  Future<void> saveThemeMode(ThemeMode theme) {
    return _dataSource.saveThemeMode(theme);
  }
}

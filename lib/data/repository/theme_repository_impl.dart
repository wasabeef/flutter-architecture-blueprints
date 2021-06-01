import 'package:app/data/local/theme_data_source.dart';
import 'package:app/data/provider/theme_data_source_provider.dart';
import 'package:app/data/repository/theme_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

import 'package:app/data/local/theme_data_source.dart';
import 'package:app/data/model/theme_setting.dart';
import 'package:app/data/repository/theme_repository.dart';
import 'package:flutter/material.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  ThemeRepositoryImpl({@required ThemeDataSource dataSource})
      : _dataSource = dataSource;

  final ThemeDataSource _dataSource;

  @override
  ThemeSetting loadThemeSetting() {
    return _dataSource.loadThemeSetting();
  }

  @override
  Future<void> saveThemeSetting(ThemeSetting theme) {
    return _dataSource.saveThemeSetting(theme);
  }
}

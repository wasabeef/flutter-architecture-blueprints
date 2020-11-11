import 'package:flutter/material.dart';

import '../local/theme_data_source.dart';
import '../model/theme_setting.dart';
import 'theme_repository.dart';

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

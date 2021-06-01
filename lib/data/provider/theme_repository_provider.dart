import 'package:app/data/repository/theme_repository.dart';
import 'package:app/data/repository/theme_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeRepositoryProvider =
    Provider<ThemeRepository>((ref) => ThemeRepositoryImpl(ref.read));

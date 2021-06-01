import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/theme_repository.dart';
import '../repository/theme_repository_impl.dart';
import 'theme_data_source_provider.dart';

final themeRepositoryProvider =
    Provider<ThemeRepository>((ref) => ThemeRepositoryImpl(ref.read));

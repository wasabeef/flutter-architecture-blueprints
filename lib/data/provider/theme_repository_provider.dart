import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/theme_repository.dart';
import '../repository/theme_repository_impl.dart';

final themeRepositoryProvider =
    Provider<ThemeRepository>((ref) => ThemeRepositoryImpl(ref.read));

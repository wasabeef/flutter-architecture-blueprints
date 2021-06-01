import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../local/theme_data_source_impl.dart';

final themeDataSourceProvider =
    Provider((ref) => ThemeDataSourceImpl(ref.read));

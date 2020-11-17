import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../local/theme_data_source_impl.dart';
import 'app_shared_preferences_provider.dart';

final themeDataSourceProvider =
    Provider((ref) => ThemeDataSourceImpl(ref.read(prefsProvider)));

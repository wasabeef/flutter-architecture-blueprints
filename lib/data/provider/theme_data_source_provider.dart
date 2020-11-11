import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../local/theme_data_source_impl.dart';
import 'shared_preferences_provider.dart';

final themeDataSourceProvider = FutureProvider((ref) async =>
    ThemeDataSourceImpl(prefs: await ref.read(prefsProvider.future)));

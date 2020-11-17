import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../local/app_shared_preferences.dart';

final prefsProvider =
    Provider<AppSharedPreferences>((ref) => AppSharedPreferences());

import 'package:app/data/local/app_shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final prefsProvider =
    Provider<AppSharedPreferences>((ref) => AppSharedPreferences());

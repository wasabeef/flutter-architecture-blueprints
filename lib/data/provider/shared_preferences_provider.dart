import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FutureProvider<SharedPreferences> prefsProvider =
    FutureProvider<SharedPreferences>((ref) => SharedPreferences.getInstance());

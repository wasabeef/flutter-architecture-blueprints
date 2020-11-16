import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  SharedPreferences _prefs;

  Future<SharedPreferences> getInstance() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs;
  }
}

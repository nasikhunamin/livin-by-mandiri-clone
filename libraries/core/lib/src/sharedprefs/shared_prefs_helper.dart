import 'package:shared_preferences/shared_preferences.dart';
import 'shared_prefs_key.dart';

class SharedPrefHelper {
  final SharedPreferences preferences;

  SharedPrefHelper({required this.preferences});

  // selected language
  String getSelectedLanguage() =>
      preferences.getString(SharedPrefsKey.selectedLanguage) ?? 'en';
  set language(String value) {
    preferences.setString(SharedPrefsKey.selectedLanguage, value);
  }

  // login status
  bool isLogin() => preferences.getBool(SharedPrefsKey.loginStatus) ?? false;
  set loginStatus(bool value) {
    preferences.setBool(SharedPrefsKey.loginStatus, value);
  }
}

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/src/sharedprefs/shared_prefs.dart';

final locator = GetIt.instance;

Future<void> inject() async {
  // shared-pref
  SharedPreferences preferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => preferences);
  locator.registerLazySingleton(() => SharedPrefHelper(preferences: locator()));
}

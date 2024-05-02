import 'package:core/core.dart';
import 'package:shared/shared.dart';

var getSelectedLanguageProvider =
    StateNotifierProvider.autoDispose<LanguageNotifier, String>((ref) {
  SharedPrefHelper pref = locator.get<SharedPrefHelper>();
  ref.keepAlive;
  return LanguageNotifier(pref.getSelectedLanguage(), pref);
});

class LanguageNotifier extends StateNotifier<String> {
  late SharedPrefHelper prefHelper;

  LanguageNotifier(String language, SharedPrefHelper s) : super(language) {
    prefHelper = s;
  }

  void updateLanguage(String val) {
    prefHelper.language = val;
    state = val;
  }
}

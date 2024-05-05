import 'package:flutter/material.dart';

import 'localizations.dart';

class AppLocalizationsDelegate
    extends LocalizationsDelegate<WmcsLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['id', 'en'].contains(locale.languageCode);

  @override
  Future<WmcsLocalizations> load(Locale locale) async {
    WmcsLocalizations localizations = WmcsLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

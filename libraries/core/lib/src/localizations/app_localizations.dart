import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations_delegate.dart';

class WmcsLocalizations {
  WmcsLocalizations(this.locale);

  final Locale locale;

  static WmcsLocalizations of(BuildContext context) {
    return Localizations.of<WmcsLocalizations>(context, WmcsLocalizations)!;
  }

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    AppLocalizationsDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  late Map<String, String> _sentences;

  Future<bool> load() async {
    String data = await rootBundle
        .loadString('assets/translations/${locale.languageCode}.json');
    final Map<String, dynamic> result =
        json.decode(data) as Map<String, dynamic>;

    _sentences = {};
    result.forEach((String key, dynamic value) {
      _sentences[key] = value.toString();
    });

    return true;
  }

  String trans(String key) {
    if (_sentences.isEmpty || !_sentences.containsKey(key)) return key;
    return _sentences[key] ?? key;
  }
}

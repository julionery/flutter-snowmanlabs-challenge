import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_localization_delegate.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  Map<String, dynamic> _localizationsStrings;

  Future<bool> load() async {
    final String jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');

    final Map<String, dynamic> jsonMap =
        jsonDecode(jsonString) as Map<String, dynamic>;

    _localizationsStrings = jsonMap.map((key, value) {
      return MapEntry(key, value);
    });
    return true;
  }

  String translate(String key,
      {Map<String, String> params, String defaultValue = ''}) {
    dynamic value;

    if (key.contains('.')) {
      key.split('.').forEach((element) {
        if (value == null) {
          value = _localizationsStrings[element];
        } else {
          value = value[element];
        }
      });
    } else {
      value = _localizationsStrings[key];
    }

    if (value == null) {
      return throw ArgumentError(
          'key: $key not found in ${locale.languageCode}.json');
    }

    if (params != null) {
      params.forEach((chave, valor) {
        value = value.replaceAll('{{$chave}}', valor);
      });
    }

    return value as String ?? defaultValue;
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static LocalizationsDelegate<AppLocalizations> delegate =
      const AppLocalizationsDelegate();
}

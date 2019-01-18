import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:ui';
import 'package:bet_master/l10n/messages_all.dart';

class AppLocalizations {

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }
  
  static Future<AppLocalizations> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }
  

  String get title {
    return Intl.message('Bet Master', name: 'title');
  }

  String get search {
    return Intl.message('Search', name: 'search');
  }

}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {

  final Locale overridenLocale;

  AppLocalizationsDelegate(this.overridenLocale);

  @override
  bool isSupported(Locale locale) {
    return overridenLocale != null;
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(overridenLocale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return true;
  }
}
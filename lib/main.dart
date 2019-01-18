import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './localization/localizations.dart';
import 'LocalHelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
    _MyAppState createState() {
      return new _MyAppState();
    }
}

class _MyAppState extends State<MyApp> {

  AppLocalizationsDelegate _appLocalizationsDelegate;

  @override
    void initState() {
      super.initState();
      helper.onLocaleChanged = onLocaleChange;
      _appLocalizationsDelegate = AppLocalizationsDelegate(new Locale('en'));
    }

  onLocaleChange(Locale locale){
    setState((){
     
      _appLocalizationsDelegate = new AppLocalizationsDelegate(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          _appLocalizationsDelegate,
        ],
        supportedLocales: [
           Locale('en'),
           Locale('es'),
        ],
        locale: _appLocalizationsDelegate.overridenLocale,
        home: new Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).title),
          ),
          body: Column(children: <Widget>[
            Text('hola'),
          ],) 
        ),
      );
  }
}

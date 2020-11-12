import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'core/consts/app_const.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConst.appName,
        theme: Modular.get<AppController>().themeApp.getTheme(),
        initialRoute: '/',
        navigatorKey: Modular.navigatorKey,
        onGenerateRoute: Modular.generateRoute,
        localeResolutionCallback: (locale, supportedLocales) {
          for (final supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      );
    });
  }
}

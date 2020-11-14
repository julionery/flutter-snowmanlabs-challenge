import 'package:flutter/material.dart';

import '../../interfaces/theme_app_interface.dart';
import '../consts/colors_const.dart';

class AppThemeLight implements IThemeAppInterface {
  @override
  ThemeData getTheme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: ColorsConst().mainColor(1),
      buttonTheme: ButtonThemeData(
        buttonColor: ColorsConst().secondaryColor(1),
      ),
      brightness: Brightness.light,
      accentColor: ColorsConst().mainColor(1),
      buttonColor: ColorsConst().secondaryColor(1),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        textTheme: TextTheme(
            headline6: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
    );
  }

  String themeToString() {
    return ThemeMode.light.toString();
  }
}

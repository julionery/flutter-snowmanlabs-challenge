import 'package:flutter/material.dart';

import '../consts/colors_const.dart';
import '../../interfaces/theme_app_interface.dart';

class AppThemeLight implements IThemeAppInterface {
  @override
  ThemeData getTheme() {
    return ThemeData(
      primaryColor: ColorsConst().mainColor(1),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      accentColor: ColorsConst().mainColor(1),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorsConst().mainColor(1),
          foregroundColor: Colors.white),
    );
  }

  String themeToString() {
    return ThemeMode.light.toString();
  }
}

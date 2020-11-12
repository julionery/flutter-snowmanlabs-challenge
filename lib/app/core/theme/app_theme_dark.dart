import 'package:flutter/material.dart';

import '../../interfaces/theme_app_interface.dart';

class AppThemeDark implements IThemeAppInterface {
  @override
  ThemeData getTheme() {
    return ThemeData.dark();
  }

  String themeToString() {
    return ThemeMode.dark.toString();
  }
}

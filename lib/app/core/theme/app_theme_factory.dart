import 'package:flutter/material.dart';

import 'app_theme_dark.dart';
import 'app_theme_light.dart';
import '../../interfaces/theme_app_interface.dart';

class AppThemeFactory {
  static IThemeAppInterface getTheme(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return AppThemeLight();
        break;
      case ThemeMode.dark:
        return AppThemeDark();
        break;
      default:
        return AppThemeLight();
        break;
    }
  }
}

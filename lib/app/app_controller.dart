import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'core/theme/app_theme_factory.dart';
import 'interfaces/theme_app_interface.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  _AppControllerBase();

  @observable
  IThemeAppInterface themeApp = AppThemeFactory.getTheme(ThemeMode.light);

  @observable
  ThemeMode themeMode = ThemeMode.light;
}

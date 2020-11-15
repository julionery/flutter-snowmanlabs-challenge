import 'package:flutter_modular/flutter_modular.dart';

import 'splash_controller.dart';
import 'splash_screen.dart';

class SplashModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => SplashController(),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => SplashScreen(),
        ),
      ];

  static Inject get to => Inject<SplashModule>.of();
}

import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'home_screen.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => HomeController(),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => HomeScreen(),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}

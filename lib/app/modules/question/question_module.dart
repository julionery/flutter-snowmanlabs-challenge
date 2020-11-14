import 'package:flutter_modular/flutter_modular.dart';

import 'question_controller.dart';
import 'question_screen.dart';

class QuestionModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => QuestionController(),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => QuestionScreen(),
        ),
      ];

  static Inject get to => Inject<QuestionModule>.of();
}

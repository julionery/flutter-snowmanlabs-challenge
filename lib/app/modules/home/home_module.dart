import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../interfaces/question_repository_interface.dart';
import '../../repositories/question_repository.dart';

import 'home_controller.dart';
import 'home_screen.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => HomeController(i.get()),
        ),
        Bind<IQuestionRepository>(
          (i) => QuestionRepository(FirebaseFirestore.instance),
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

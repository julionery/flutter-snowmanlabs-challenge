import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../interfaces/question_repository_interface.dart';
import '../../repositories/firebase/question_firebase_repository.dart';

import 'question_controller.dart';
import 'question_screen.dart';

class QuestionModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => QuestionController(i.get()),
        ),
        Bind<IQuestionRepository>(
          (i) => QuestionFirebaseRepository(FirebaseFirestore.instance),
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

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/consts/routers_const.dart';
import '../../interfaces/question_repository_interface.dart';
import '../../models/question_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final IQuestionRepository repository;

  @observable
  bool loading = false;

  @observable
  String search = '';

  @observable
  ObservableStream<List<QuestionModel>> questionList;

  _HomeController(this.repository) {
    getList();
  }

  @computed
  bool get searchIsNotEmpty => search.isNotEmpty;

  @action
  void getList() {
    questionList = repository.getQuestions().asObservable();
  }

  Future<bool> doAddQuestion() async {
    final result = await Modular.to.pushNamed(RoutersConst.question);
    return result as bool;
  }
}

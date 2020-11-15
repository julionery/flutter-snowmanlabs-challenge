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
  ObservableStream<List<QuestionModel>> allQuestion;

  QuestionModel questionEditing;

  _HomeController(this.repository) {
    getList();
  }

  @computed
  bool get searchIsNotEmpty => search.isNotEmpty;

  @action
  void getList() {
    allQuestion = repository.getQuestions().asObservable();
  }

  List<QuestionModel> getFilteredQuestions() {
    final List<QuestionModel> filteredList = [];

    final List<QuestionModel> list = allQuestion.data as List<QuestionModel>;

    if (search == null || search.isEmpty) {
      filteredList.addAll(list);
    } else {
      filteredList.addAll(list
          .where((p) => p.title.toLowerCase().contains(search.toLowerCase())));
    }

    return filteredList;
  }

  Future<bool> goQuestion([QuestionModel model]) async {
    questionEditing = model;
    final result = await Modular.to.pushNamed(RoutersConst.question);
    return result as bool;
  }

  Future saveQuestion(QuestionModel model) => repository.save(model);

  Future deleteQuestion(QuestionModel model) => repository.delete(model);
}

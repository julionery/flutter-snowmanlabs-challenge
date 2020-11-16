import 'package:flutter/material.dart';
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

  _HomeController(this.repository) {
    getList();
  }

  @computed
  bool get searchIsNotEmpty => search.isNotEmpty;

  @computed
  List<QuestionModel> get filteredQuestions {
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

  @action
  Future getList() async {
    final response = await repository.getQuestions();
    if (response.success) {
      final result = response.object as Stream<List<QuestionModel>>;
      allQuestion = result.asObservable();
    }
  }

  @action
  Future<void> deleteQuestion(QuestionModel model) async {
    final response = await repository.delete(model);
    if (!response.success) {
      throw response;
    }
  }

  Future<bool> goQuestion([QuestionModel model]) async {
    final response = await Modular.to
        .pushNamed(RoutersConst.home + RoutersConst.question, arguments: model);
    return response as bool;
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/consts/colors_const.dart';
import '../../models/question_model.dart';
import '../../modules/home/home_controller.dart';

part 'question_controller.g.dart';

class QuestionController = _QuestionController with _$QuestionController;

abstract class _QuestionController with Store {
  @observable
  bool loading = false;

  @observable
  bool isEditing = false;

  @observable
  QuestionModel model;

  @observable
  String selectedColor = ColorsConst.arrayColorsQuestion.first;

  _QuestionController() {
    final homeStore = Modular.get<HomeController>();

    if (homeStore.questionEditing != null) {
      model = homeStore.questionEditing;
      selectedColor = model.color;
      isEditing = true;
    } else {
      model = QuestionModel();
      model.color = selectedColor;
      isEditing = false;
    }
  }

  Future<void> save() async {
    loading = true;
    final homeStore = Modular.get<HomeController>();
    await homeStore.saveQuestion(model);
    loading = false;
  }
}

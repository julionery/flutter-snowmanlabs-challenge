import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../core/consts/colors_const.dart';

part 'question_controller.g.dart';

class QuestionController = _QuestionController with _$QuestionController;

abstract class _QuestionController with Store {
  @observable
  bool loading = false;

  @observable
  String title = '';

  @observable
  String answer = '';

  @observable
  String color = ColorsConst.arrayColorsQuestion.first;

  Future<void> save() async {
    loading = true;

    debugPrint(title);
    debugPrint(answer);

    await Future.delayed(const Duration(seconds: 3));
    loading = false;
    // throw "response";
  }
}

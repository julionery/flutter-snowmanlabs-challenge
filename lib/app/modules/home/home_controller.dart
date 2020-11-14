import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/consts/routers_const.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  bool loading = false;

  @observable
  String search = '';

  @computed
  bool get searchIsNotEmpty => search.isNotEmpty;

  Future<bool> doAddQuestion() async {
    final result = await Modular.to.pushNamed(RoutersConst.question);
    return result as bool;
  }
}

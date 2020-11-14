import 'package:flutter_modular/flutter_modular.dart';

import '../../core/consts/routers_const.dart';

class HomeController {
  Future<bool> doAddQuestion() async {
    final result = await Modular.to.pushNamed(RoutersConst.question);
    return result as bool;
  }
}

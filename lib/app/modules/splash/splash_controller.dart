import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/consts/routers_const.dart';

class SplashController {
  Future<void> initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  Future<void> goToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Modular.to.pushReplacementNamed(RoutersConst.home);
  }
}

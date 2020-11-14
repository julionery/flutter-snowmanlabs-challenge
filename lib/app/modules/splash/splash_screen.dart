import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/consts/assets_const.dart';
import '../../core/consts/colors_const.dart';
import '../../core/consts/routers_const.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToHome();
  }

  Future<void> goToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Modular.to.pushReplacementNamed(RoutersConst.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst().secondaryColor(1),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(AssetsConst.splash),
            )),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}

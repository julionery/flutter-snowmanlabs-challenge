import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    checkUserSkipIntro();
  }

  Future<void> checkUserSkipIntro() async {
    await Future.delayed(const Duration(seconds: 1));
    Modular.to.pushReplacementNamed(RoutersConst.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: ColorsConst().secondaryColor(1),
          ),
          Center(
            child: Text(
              "Snowmanlabs\nChallenge",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorsConst().mainColor(1),
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

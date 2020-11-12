import 'package:flutter/material.dart';

import '../../core/localization/app_translate.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppTranslate(context).text('home.title'),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(),
    );
  }
}

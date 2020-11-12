import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Perguntas Frequentes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(),
    );
  }
}

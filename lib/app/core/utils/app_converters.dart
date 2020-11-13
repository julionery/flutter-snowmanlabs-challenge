import 'package:flutter/material.dart';

class AppConverters {
  static Color hexToFlutterColor({String hexColor}) {
    try {
      final intColor =
          int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000;
      return Color(intColor);
    } catch (e) {
      return const Color(0xFFFFFFFF);
    }
  }
}

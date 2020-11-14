import 'package:flutter/material.dart';

class ColorsConst {
  static final arrayColorsQuestion = [
    '#46c9a7',
    '#ff7074',
    '#ffbe00',
    '#10159a',
  ];

  static Color get success => const Color(0xFF46c9a7);
  static Color get fail => const Color(0xFFff7074);

  final Color _mainColor = const Color(0xFF10159a);
  final Color _secondaryColor = const Color(0xFFffbe00);
  final Color _backgroundMainColor = const Color.fromRGBO(15, 19, 122, 1);

  Color mainColor(double opacity) {
    return _mainColor.withOpacity(opacity);
  }

  Color backgroundMainColor(double opacity) {
    return _backgroundMainColor.withOpacity(opacity);
  }

  Color secondaryColor(double opacity) {
    return _secondaryColor.withOpacity(opacity);
  }
}

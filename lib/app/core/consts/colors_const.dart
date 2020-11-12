import 'package:flutter/material.dart';

class ColorsConst {
  final Color _mainColor = const Color(0xFF10159a);
  final Color _secondaryColor = const Color(0xFFffbe00);

  Color mainColor(double opacity) {
    return _mainColor.withOpacity(opacity);
  }

  Color secondaryColor(double opacity) {
    return _secondaryColor.withOpacity(opacity);
  }
}

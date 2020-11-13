import 'package:flutter/material.dart';

class ColorsConst {
  final Color _mainColor = const Color(0xFF10159a);
  final Color _secondaryColor = const Color(0xFFffbe00);

  final Color _taskColor1 = const Color(0xFF46c9a7);
  final Color _taskColor2 = const Color(0xFFff7074);
  final Color _taskColor3 = const Color(0xFFffbe00);
  final Color _taskColor4 = const Color(0xFF10159a);

  Color mainColor(double opacity) {
    return _mainColor.withOpacity(opacity);
  }

  Color secondaryColor(double opacity) {
    return _secondaryColor.withOpacity(opacity);
  }
}

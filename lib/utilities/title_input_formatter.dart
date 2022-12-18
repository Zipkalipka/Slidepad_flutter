import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TitleCutter extends TextInputFormatter {
  final TextStyle style;
  final int limiter;
  TitleCutter(this.style, this.limiter);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if ((sizeController(newValue.text, style))>limiter) {
      return oldValue;
    } else {
      return newValue;
    }
  }

  double sizeController(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaleFactor: WidgetsBinding.instance.window.textScaleFactor,
    )..layout();
    return textPainter.size.width;
  }
}
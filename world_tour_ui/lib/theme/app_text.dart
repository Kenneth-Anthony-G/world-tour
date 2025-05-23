import 'package:flutter/material.dart';

class AppText {
  AppText._();

  /// Base text style factory
  static TextStyle _baseStyle({
    double fontSize = 20,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: Colors.black,
    );
  }

  /// Extra large style (e.g., for headers or large titles)
  static final TextStyle xl = _baseStyle(fontSize: 24);

  /// Large style (e.g., for section titles)
  static final TextStyle large = _baseStyle(fontSize: 20);

  /// Medium style (e.g., for normal content text)
  static final TextStyle medium = _baseStyle(fontSize: 16);

  /// Small style (e.g., for captions or secondary text)
  static final TextStyle small = _baseStyle(fontSize: 14);
}

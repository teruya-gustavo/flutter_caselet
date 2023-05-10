import 'package:flutter/material.dart';

class ColorMapper {
  static Color? fromString(String colorString) {
    if (colorString == 'Colors.amber[400]') {
      return Colors.amber[400];
    }

    if (colorString == 'Colors.red') {
      return Colors.red;
    }

    if (colorString == 'Colors.orange') {
      return Colors.orange;
    }

    return Colors.black;
  }
}

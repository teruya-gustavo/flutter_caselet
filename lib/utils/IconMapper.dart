import 'package:flutter/material.dart';

class IconMapper {
  static IconData? fromString(String colorString) {
    if (colorString == 'Icons.warning_rounded') {
      return Icons.warning_rounded;
    }

    if (colorString == 'Icons.air') {
      return Icons.air;
    }

    if (colorString == 'Icons.local_fire_department') {
      return Icons.local_fire_department;
    }

    if (colorString == 'Icons.engineering') {
      return Icons.engineering;
    }

    return Icons.abc;
  }
}

import 'package:flutter/material.dart';

import '../utils/ColorMapper.dart';
import '../utils/IconMapper.dart';

class Alert {
  final String title;
  final String subtitle;
  final IconData? icon;
  final Color? color;

  Alert.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        subtitle = json["subtitle"],
        icon = IconMapper.fromString(json["icon"]),
        color = ColorMapper.fromString(json["color"]);
}

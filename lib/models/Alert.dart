import 'package:flutter/material.dart';

import '../utils/color_mapper.dart';
import '../utils/icon_mapper.dart';

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

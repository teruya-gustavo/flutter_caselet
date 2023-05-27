import 'package:flutter/material.dart';
import 'package:flutter_caselet/alerts_list.dart';
import 'package:flutter_caselet/priority_info.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(),
      scrollDirection: Axis.vertical,
      child: const Column(
        children: [
          PriorityInfo(),
          AlertsList(),
        ],
      ),
    );
  }
}

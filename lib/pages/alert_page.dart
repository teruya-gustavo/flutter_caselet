import 'package:flutter/material.dart';
import 'package:flutter_caselet/alerts_list.dart';
import 'package:flutter_caselet/priority_info.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AlertPageState();
  }
}

class _AlertPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Column(children: [PriorityInfo(), const AlertsList()]);
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter_caselet/alert_card.dart';
import 'package:flutter_caselet/models/Alert.dart';

class AlertsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AlertsListState();
}

class AlertsListState extends State<AlertsList> {
  List<Alert> alertData = [];

  Future<void> getAlertListFromJson() async {
    final String response =
        await rootBundle.loadString('data/alerts_data.json');
    final List<dynamic> alert_json = await json.decode(response);

    setState(() {
      alertData =
          alert_json.map((alert_data) => Alert.fromJson(alert_data)).toList();
    });
  }

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getAlertListFromJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...alertData.map((alert) => AlertCard(alert)).toList(),
      ],
    );
  }
}

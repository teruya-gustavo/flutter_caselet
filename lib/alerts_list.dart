import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_caselet/alert_card.dart';
import 'package:flutter_caselet/models/alert.dart';

class AlertsList extends StatefulWidget {
  const AlertsList({super.key});

  @override
  State<StatefulWidget> createState() => AlertsListState();
}

class AlertsListState extends State<AlertsList> {
  List<Alert> alertData = [];

  Future<void> getAlertListFromJson() async {
    final String response =
        await rootBundle.loadString('data/alerts_data.json');
    final List<dynamic> alertJson = await json.decode(response);

    setState(() {
      alertData =
          alertJson.map((alertData) => Alert.fromJson(alertData)).toList();
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
        ...alertData
            .map(
              (alert) => AlertCard(alert),
            )
            .toList(),
      ],
    );
  }
}

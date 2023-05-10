import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        ...alertData
            .map((alert) => Card(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Icon(
                          alert.icon,
                          size: 50,
                          color: alert.color,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                alert.title,
                                style: const TextStyle(fontSize: 20),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                alert.subtitle,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
            .toList()
      ],
    );

    // return Column(
    //   children: [
    //     Card(
    //       child: Row(
    //         children: [
    //           Padding(
    //             padding: EdgeInsets.all(20),
    //             child: Icon(
    //               Icons.air,
    //               size: 50,
    //               color: Colors.red,
    //             ),
    //           ),
    //           Expanded(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 Flexible(
    //                   child: Text(
    //                     "Belt Sensor",
    //                     style: TextStyle(fontSize: 20),
    //                     textAlign: TextAlign.start,
    //                   ),
    //                 ),
    //                 Flexible(
    //                   child: Text(
    //                     "Inspect main belt of oven 1, stop machine if damaged.",
    //                     textAlign: TextAlign.start,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }
}

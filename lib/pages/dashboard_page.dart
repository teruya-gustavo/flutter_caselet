import 'package:flutter/material.dart';
import 'package:flutter_caselet/labeled_circular_progress.dart';
import 'package:flutter_caselet/labeled_gauge.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        children: [
          Card(
            elevation: 3,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: const [
                  Text(
                    "Current Health Index",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  LabeledCircularProgress(.75),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: LabeledGauge(.75, "A label"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: LabeledGauge(.75, "A label"),
                  ),
                  LabeledGauge(.75, "A label"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

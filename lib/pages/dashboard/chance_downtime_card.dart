import 'package:flutter/material.dart';
import 'package:flutter_caselet/pages/dashboard/downtime_meter.dart';
import 'package:flutter_caselet/pages/dashboard/labeled_box.dart';

class ChanceDowntimeCard extends StatelessWidget {
  final double chanceDowntime;
  const ChanceDowntimeCard(this.chanceDowntime, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Chance Downtime",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LabeledBox(Colors.green[200], Colors.green[900], "Low"),
                LabeledBox(Colors.green[200], Colors.green[900], "Low"),
                LabeledBox(Colors.yellow[200], Colors.yellow[900], "Medium"),
                LabeledBox(Colors.yellow[200], Colors.yellow[900], "Medium"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: DowntimeMeter(chanceDowntime),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LabeledBox(Colors.grey[200], Colors.black, "Current Shift"),
                LabeledBox(Colors.grey[200], Colors.black, "Next Shift"),
                LabeledBox(Colors.grey[200], Colors.black, "Next 2 Shifts"),
                LabeledBox(Colors.grey[200], Colors.black, "Over 1 Week"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

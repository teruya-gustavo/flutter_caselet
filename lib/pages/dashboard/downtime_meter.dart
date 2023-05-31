import 'package:flutter/material.dart';
import 'package:flutter_caselet/pages/dashboard/downtime_meter_gauge_placeholder.dart';

class DowntimeMeter extends StatelessWidget {
  final double chanceDowntime;

  const DowntimeMeter(this.chanceDowntime, {super.key});

  Color? getColor(value) {
    if (value < 0.3) {
      return Colors.green[400];
    }

    if (value >= 0.3 && value <= 0.6) {
      return Colors.yellow[600];
    }

    return Colors.red[400];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const DowntimeMeterGaugePlaceholder(),
      Row(
        children: [
          Container(
              height: 30,
              width: (MediaQuery.of(context).size.width * chanceDowntime),
              decoration: const BoxDecoration(color: null)),
          Container(
            height: 30,
            width: 5,
            decoration: BoxDecoration(
              color: getColor(chanceDowntime),
            ),
          ),
        ],
      ),
    ]);
  }
}

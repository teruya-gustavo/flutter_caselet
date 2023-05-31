import 'package:flutter/material.dart';
import 'package:flutter_caselet/pages/dashboard/labeled_circular_progress.dart';
import 'package:flutter_caselet/pages/dashboard/labeled_gauge.dart';
import 'package:flutter_caselet/models/machine_summary.dart';

class MachineSummaryCard extends StatelessWidget {
  final MachineSummary machineSummary;
  const MachineSummaryCard(this.machineSummary, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              "Current Health Index",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            LabeledCircularProgress(machineSummary.currentHealthIndex),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: LabeledGauge(
                  machineSummary.heatingSystemIndex, "Heating System"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: LabeledGauge(machineSummary.beltIndex, "Belt"),
            ),
            LabeledGauge(machineSummary.fanIndex, "Fan"),
          ],
        ),
      ),
    );
  }
}

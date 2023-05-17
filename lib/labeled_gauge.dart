import 'package:flutter/material.dart';

class LabeledGauge extends StatelessWidget {
  final double percentage;
  final String label;

  const LabeledGauge(this.percentage, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          width: MediaQuery.of(context).size.width),
      Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.green[200],
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        width: MediaQuery.of(context).size.width * percentage,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Text(
                "${(percentage * 100).round().toString()}%",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 24,
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}

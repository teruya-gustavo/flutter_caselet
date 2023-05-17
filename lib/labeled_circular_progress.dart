import 'package:flutter/material.dart';

class LabeledCircularProgress extends StatelessWidget {
  final double progress;
  const LabeledCircularProgress(this.progress, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 40),
              child: SizedBox(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[300],
                  color: Colors.green[200],
                  strokeWidth: 30,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 100,
            ),
            Text(
              "${(progress * 100).round().toString()}%",
              style: TextStyle(fontSize: 46, color: Colors.green[900]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}

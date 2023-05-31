import 'package:flutter/material.dart';

class LabeledBox extends StatelessWidget {
  final Color? boxColor;
  final Color? textColor;
  final String label;

  const LabeledBox(this.boxColor, this.textColor, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      width: MediaQuery.of(context).size.width / 100 * 20,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor),
      ),
    );
  }
}

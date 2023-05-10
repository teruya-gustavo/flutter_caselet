import 'package:flutter/material.dart';

class PriorityInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Priority:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 20,
          width: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
          ),
        ),
        Text(
          'High',
          style: TextStyle(color: Colors.red, fontSize: 20),
        ),
        SizedBox(
          height: 20,
          width: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.orange),
          ),
        ),
        Text(
          'Medium',
          style: TextStyle(color: Colors.orange, fontSize: 20),
        ),
        SizedBox(
          height: 20,
          width: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.yellow),
          ),
        ),
        Text(
          'Low',
          style: TextStyle(color: Colors.yellow, fontSize: 24),
        )
      ],
    );
  }
}

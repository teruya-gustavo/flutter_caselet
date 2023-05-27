import 'package:flutter/material.dart';

class DowntimeMeterGaugePlaceholder extends StatelessWidget {
  const DowntimeMeterGaugePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: 5,
        decoration: BoxDecoration(color: Colors.grey[200]),
      ),
      SizedBox(
        height: 30,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 5,
              decoration: BoxDecoration(color: Colors.grey[200]),
            ),
            Container(
              width: 5,
              decoration: BoxDecoration(color: Colors.grey[200]),
            ),
            Container(
              width: 5,
              decoration: BoxDecoration(color: Colors.grey[200]),
            ),
            Container(
              width: 5,
              decoration: BoxDecoration(color: Colors.grey[200]),
            )
          ],
        ),
      ),
    ]);
  }
}

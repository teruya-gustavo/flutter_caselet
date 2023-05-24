import 'package:flutter/material.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<StatefulWidget> createState() => TicketsPageState();
}

class TicketsPageState extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      children: [
        ExpansionPanel(
          headerBuilder: (context, booleano) => const Text("Header"),
          body: const Text("Body"),
          isExpanded: true,
        ),
      ],
    );
  }
}

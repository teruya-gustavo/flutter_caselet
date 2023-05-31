import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_caselet/models/ticket.dart';
import 'package:flutter_caselet/pages/tickets/ticket_form.dart';
import 'package:flutter_caselet/pages/tickets/ticket_panel.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<StatefulWidget> createState() => TicketsPageState();
}

class TicketsPageState extends State<TicketsPage> {
  List<TicketPanel> ticketPanelList = [];
  String titleField = '';
  String descriptionField = '';

  Future<void> getTicketsDataFromJson() async {
    final String response =
        await rootBundle.loadString('data/tickets_data.json');
    final List<dynamic> ticketsDataJson = await json.decode(response);

    setState(() {
      ticketPanelList = ticketsDataJson
          .map((ticketJson) => Ticket.fromJson(ticketJson))
          .map((ticket) => TicketPanel(ticket))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getTicketsDataFromJson();
    });
  }

  void handleTitleFieldChange(String newValue) {
    setState(() {
      titleField = newValue;
    });
  }

  void handleDescriptionFieldChange(String newValue) {
    setState(() {
      descriptionField = newValue;
    });
  }

  void showTicketForm() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Create Ticket'),
        content:
            TicketForm(handleTitleFieldChange, handleDescriptionFieldChange),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Cancel');
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Ticket newTicket = Ticket(1, 1, titleField, descriptionField);
              setState(() {
                ticketPanelList.add(TicketPanel(newTicket));
                titleField = '';
                descriptionField = '';
              });
              Navigator.pop(context, 'Submit Ticket');
            },
            child: const Text('Submit Ticket'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SingleChildScrollView(
        controller: ScrollController(),
        scrollDirection: Axis.vertical,
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              ticketPanelList[index].isExpanded = !isExpanded;
            });
          },
          children: [
            ...(ticketPanelList.map<ExpansionPanel>(
              (item) => item.getExpansionPanel(context, item.isExpanded),
            )),
          ],
        ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton.extended(
            label: const Icon(Icons.add), onPressed: showTicketForm),
      ),
    ]);
  }
}

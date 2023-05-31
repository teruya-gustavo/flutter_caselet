import 'package:flutter/material.dart';

import '../../models/ticket.dart';

class TicketExpansionItem {
  final Ticket ticket;
  final bool isExpanded;

  TicketExpansionItem(this.ticket, this.isExpanded);
}

class TicketPanel {
  final Ticket ticket;
  bool isExpanded = false;

  TicketPanel(this.ticket);

  ExpansionPanel getExpansionPanel(BuildContext context, bool isExpanded) {
    return ExpansionPanel(
      headerBuilder: (context, isExpanded) => ListTile(
        title: Text(
          ticket.title,
          style: const TextStyle(fontSize: 24, color: Colors.green),
        ),
        subtitle: Text(
          "Ticket ID: ${ticket.id} | Alert ID: ${ticket.alertId}",
          style: const TextStyle(fontSize: 16, color: Colors.green),
        ),
      ),
      body: ListTile(
        title: Text(
          ticket.description,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: ticket.picture != null
            ? Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ticket.picture as String),
                  ),
                ),
              )
            : null,
      ),
      isExpanded: isExpanded,
    );
  }
}

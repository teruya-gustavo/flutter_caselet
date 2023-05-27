import 'package:flutter/material.dart';
import 'package:flutter_caselet/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'models/alert.dart';

class AlertCard extends StatefulWidget {
  final Alert alert;
  const AlertCard(this.alert, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AlertCardState();
}

class AlertCardState extends State<AlertCard> {
  bool done = false;

  AlertCardState();

  void changeDoneState(BuildContext context) {
    setState(() {
      done = !done;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Alert alert = widget.alert;

    return Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: changeDoneState,
              backgroundColor: Colors.green[600] as Color,
              foregroundColor: Colors.white,
              icon: done == true ? Icons.check : Icons.square_outlined,
              label: 'Done',
            ),
            const CreateTicketButton(),
          ],
        ),
        child: Card(
          elevation: 3,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Icon(
                  alert.icon,
                  size: 50,
                  color: alert.color,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        alert.title,
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        alert.subtitle,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class CreateTicketButton extends ConsumerWidget {
  const CreateTicketButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void doNothing(BuildContext context) {
      ref.read(pageIndexProvider.notifier).changePage(2);
    }

    return SlidableAction(
      onPressed: doNothing,
      backgroundColor: Colors.lightGreen[600] as Color,
      foregroundColor: Colors.white,
      icon: Icons.add,
      label: 'Ticket',
    );
  }
}

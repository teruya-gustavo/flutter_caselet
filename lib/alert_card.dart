import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'models/Alert.dart';

class AlertCard extends StatefulWidget {
  final Alert alert;
  const AlertCard(this.alert, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AlertCardState();
}

class AlertCardState extends State<AlertCard> {
  bool done = false;

  void doNothing(BuildContext context) {
    //TODO: create ticket route and make this function navigate to it.
    throw UnimplementedError();
  }

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
            SlidableAction(
              onPressed: doNothing,
              backgroundColor: Colors.lightGreen[600] as Color,
              foregroundColor: Colors.white,
              icon: Icons.add,
              label: 'Ticket',
            ),
          ],
        ),
        child: Card(
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

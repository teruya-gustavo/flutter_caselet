import 'package:flutter/material.dart';

class TicketForm extends StatelessWidget {
  final Function(String value) onChangeTitle;
  final Function(String value) onChangeDescription;

  const TicketForm(this.onChangeTitle, this.onChangeDescription, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          TextFormField(
            onChanged: onChangeTitle,
            decoration: const InputDecoration(
              hintText: 'Title',
            ),
          ),
          TextFormField(
            onChanged: onChangeDescription,
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
          )
        ],
      ),
    );
  }
}

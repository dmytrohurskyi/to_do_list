import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';
import 'package:to_do_list/ui/model/to_do_data_model.dart';

class AddTaskDialogWidget extends StatelessWidget {
  final _db = Localstore.instance;

  AddTaskDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String valueText = '';
    return AlertDialog(
      title: const Text(
        'Add new task',
        style: TextStyle(fontSize: 22),
      ),
      content: TextField(
        onChanged: (value) {
          valueText = value;
        },
        decoration: const InputDecoration(
            hintText: "Type in the name of your task",
            hintStyle: TextStyle(fontSize: 19)),
        style: const TextStyle(fontSize: 20),
        minLines: 1,
        maxLines: 3,
      ),
      actions: [
        TextButton(
          onPressed: () {
            final id = _db.collection('todos').doc().id;
            final newTask = ToDo(
              id: id,
              text: valueText,
              isCompleted: false,
            );
            newTask.save();
            Navigator.pop(context);
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.green),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'CANCEL',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

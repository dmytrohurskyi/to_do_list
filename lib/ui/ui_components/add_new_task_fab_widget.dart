import 'package:flutter/material.dart';
import 'package:to_do_list/ui/ui_components/add_task_dialog_widget.dart';

class AddNewTaskFabWidget extends StatelessWidget {
  const AddNewTaskFabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _displayTextInputDialog(context),
      child: const Icon(Icons.add_task),
      backgroundColor: Colors.orange,
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AddTaskDialogWidget();
        });
  }
}

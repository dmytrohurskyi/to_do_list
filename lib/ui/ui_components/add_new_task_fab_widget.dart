import 'package:flutter/material.dart';

class AddNewTaskFabWidget extends StatelessWidget {
  const AddNewTaskFabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add_task),
      backgroundColor: Colors.orangeAccent,
    );
  }
}

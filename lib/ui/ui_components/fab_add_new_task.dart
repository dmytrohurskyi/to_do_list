import 'package:flutter/material.dart';

class FabAddNewTask extends StatelessWidget {
  const FabAddNewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add_task),
      backgroundColor: Colors.orangeAccent,
    );
  }
}

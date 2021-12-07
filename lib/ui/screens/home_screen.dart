import 'package:flutter/material.dart';
import 'package:to_do_list/ui/ui_components/add_new_task_fab_widget.dart';
import 'package:to_do_list/ui/ui_components/home_body_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        title: const Text("ToDo List"),
        backgroundColor: Colors.deepOrange[700],
      ),
      body: const HomeBodyWidget(),
      floatingActionButton: const AddNewTaskFabWidget(),
    );
  }
}

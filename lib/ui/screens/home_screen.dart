import 'package:flutter/material.dart';
import 'package:to_do_list/ui/ui_components/fab_add_new_task.dart';
import 'package:to_do_list/ui/ui_components/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        title: Text("ToDo List"),
        backgroundColor: Colors.deepOrange[700],
      ),
      body: HomeBody(),
      floatingActionButton: const FabAddNewTask(),
    );
  }
}

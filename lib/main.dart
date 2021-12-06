import 'package:flutter/material.dart';
import 'package:to_do_list/ui/screens/home_screen.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData(
          textTheme: const TextTheme(
        button: TextStyle(fontSize: 18),
      )),
    );
  }
}

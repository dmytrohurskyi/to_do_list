import 'package:flutter/material.dart';

class ListItemWidget extends StatefulWidget {
  final String textToShow;

  const ListItemWidget({Key? key, required this.textToShow}) : super(key: key);

  @override
  _ListItemWidgetState createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.deepOrange[700],
              fillColor: MaterialStateProperty.resolveWith((states) {
                return Colors.deepOrange[700];
              }),
              value: isDone,
              onChanged: (bool? value) {
                setState(() {
                  isDone = value!;
                });
              }),
          Text(
            widget.textToShow,
            style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                decoration: isDone ? TextDecoration.lineThrough : null),
          ),
        ],
      ),
    );
  }
}

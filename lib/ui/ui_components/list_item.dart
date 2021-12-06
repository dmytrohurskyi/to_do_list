import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String textToShow;

  const ListItem({Key? key, required this.textToShow}) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
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

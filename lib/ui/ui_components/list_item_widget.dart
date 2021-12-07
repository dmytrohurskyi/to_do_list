import 'package:flutter/material.dart';
import 'package:to_do_list/ui/model/to_do_data_model.dart';

class ListItemWidget extends StatefulWidget {
  final ToDo task;

  const ListItemWidget({Key? key, required this.task}) : super(key: key);

  @override
  _ListItemWidgetState createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
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
              value: widget.task.isCompleted,
              onChanged: (bool? value) {
                setState(() {
                  widget.task.isCompleted = value!;
                  widget.task.save();
                });
              }),
          Text(
            widget.task.text,
            style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                decoration: widget.task.isCompleted
                    ? TextDecoration.lineThrough
                    : null),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';
import 'package:to_do_list/ui/model/to_do_data_model.dart';
import 'package:to_do_list/utils/sorting/todo_map_sort.dart';

// This enum contains options that used as sorting filters down below
enum _MenuSortingOptions {
  ascendingOrder,
  descendingOrder,
  shortestToLongest,
  longestToShortest
}

class SortPopupMenuWidget extends StatefulWidget {
  const SortPopupMenuWidget({Key? key}) : super(key: key);

  @override
  _SortPopupMenuWidgetState createState() => _SortPopupMenuWidgetState();
}

class _SortPopupMenuWidgetState extends State<SortPopupMenuWidget> {
  final _toDos = <String, ToDo>{};
  final _db = Localstore.instance;
  StreamSubscription<Map<String, dynamic>>? _subscription;

  @override
  void initState() {
    _subscription = _db.collection('todos').stream.listen((event) {
      setState(() {
        final item = ToDo.fromMap(event);
        _toDos.putIfAbsent(item.id, () => item);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_MenuSortingOptions>(
      icon: const Icon(
        Icons.sort,
        size: 26,
      ),
      onSelected: (_MenuSortingOptions result) async {
        switch (result) {
          case _MenuSortingOptions.ascendingOrder:
            setState(() {
              var sortedTasks = ascendingTodoMapSort(_toDos);
              sortedTasks.forEach((key, value) {
                final item = _toDos[key];
                item!.delete();
                _toDos.remove(item.id);
              });
              sortedTasks.forEach((key, value) {
                final item = sortedTasks[key];
                item!.save();
                _toDos.putIfAbsent(item.id, () => item);
              });
            });
            break;
          case _MenuSortingOptions.descendingOrder:
            setState(() {
              var sortedTasks = descendingTodoMapSort(_toDos);
              sortedTasks.forEach((key, value) {
                final item = _toDos[key];
                item!.delete();
                _toDos.remove(item.id);
              });
              sortedTasks.forEach((key, value) {
                final item = sortedTasks[key];
                item!.save();
                _toDos.putIfAbsent(item.id, () => item);
              });
            });
            break;
          case _MenuSortingOptions.shortestToLongest:
            // TODO: Handle this case.
            break;
          case _MenuSortingOptions.longestToShortest:
            // TODO: Handle this case.
            break;
        }
      },
      itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<_MenuSortingOptions>>[
        const PopupMenuItem(
          value: _MenuSortingOptions.ascendingOrder,
          child: Text('Sort in ascending order'),
          textStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
        const PopupMenuItem(
          value: _MenuSortingOptions.descendingOrder,
          child: Text('Sort in descending order'),
          textStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
        const PopupMenuItem(
          value: _MenuSortingOptions.longestToShortest,
          child: Text('Longest to shortest'),
          textStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
        const PopupMenuItem(
          value: _MenuSortingOptions.shortestToLongest,
          child: Text('Shortest to longest'),
          textStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ],
    );
  }
}

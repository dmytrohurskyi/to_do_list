import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:localstore/localstore.dart';
import 'package:to_do_list/ui/model/to_do_data_model.dart';
import 'package:to_do_list/ui/ui_components/list_item_widget.dart';
import 'package:to_do_list/ui/ui_components/sort_popup_menu_widget.dart';

class HomeBodyWidget extends StatefulWidget {
  final MenuSortingOptions? selectedOption;

  const HomeBodyWidget({Key? key, this.selectedOption}) : super(key: key);

  @override
  _HomeBodyWidgetState createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  final _toDos = <String, ToDo>{};
  final _db = Localstore.instance;

  StreamSubscription<Map<String, dynamic>>? _subscription;

  int countItems = 0;

  @override
  void initState() {
    _subscription = _db.collection('todos').stream.listen((event) async {
      if (_toDos.isEmpty) {
        final items = await _db.collection('todos').get();
        countItems = items?.length ?? 0;
      } else if (_toDos.length == countItems) {
        _toDos.clear();
      }
      setState(() {
        final item = ToDo.fromMap(event);
        _toDos.putIfAbsent(item.id, () => item);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _toDos.keys.length,
        itemBuilder: (_, index) {
          final item = _toDos[_toDos.keys.elementAt(index)];

          return Dismissible(
            key: Key(_toDos.keys.elementAt(index)),
            child: ListItemWidget(
              task: item!,
            ),
            background: Container(color: Colors.redAccent),
            onDismissed: (_) {
              setState(() {
                var deletedTask = item;
                item.delete();
                _toDos.remove(item.id);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text(
                    'The task was deleted.',
                    style: TextStyle(fontSize: 20),
                  ),
                  action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        setState(() {
                          deletedTask.save();
                          _toDos.putIfAbsent(deletedTask.id, () => deletedTask);
                        });
                      }),
                ));
              });
            },
          );
        });
  }
}

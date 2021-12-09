import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';
import 'package:to_do_list/ui/model/to_do_data_model.dart';
import 'package:to_do_list/ui/ui_components/add_new_task_fab_widget.dart';
import 'package:to_do_list/ui/ui_components/home_body_widget.dart';
import 'package:to_do_list/ui/ui_components/sort_popup_menu_widget.dart';
import 'package:to_do_list/services/sort_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  MenuSortingOptions? selectedOption;
  final SortService _sortService = SortService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        title: const Text("ToDo List"),
        backgroundColor: Colors.deepOrange[700],
        actions: [
          SortPopupMenuWidget(
            onSelect: (type) async {
              selectedOption = type;
              setState(() {
                _sortService.sort(type, _toDos);
              });
            },
          ),
        ],
      ),
      body: HomeBodyWidget(
        selectedOption: selectedOption,
      ),
      floatingActionButton: const AddNewTaskFabWidget(),
    );
  }
}

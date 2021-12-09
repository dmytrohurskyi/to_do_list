import 'dart:async';

import 'package:localstore/localstore.dart';
import 'package:to_do_list/ui/model/to_do_data_model.dart';
import 'package:to_do_list/ui/ui_components/sort_popup_menu_widget.dart';
import 'package:to_do_list/utils/sorting/todo_map_sort.dart';

class SortService {
  final _db = Localstore.instance;
  StreamSubscription<Map<String, dynamic>>? _subscription;

  SortService();

  void sort(MenuSortingOptions sortType, Map<String, ToDo> _toDos) {
    _subscription = _db.collection('todos').stream.listen((event) {
      final item = ToDo.fromMap(event);
      _toDos.putIfAbsent(item.id, () => item);
    });

    switch (sortType) {
      case MenuSortingOptions.ascendingOrder:
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
        break;
      case MenuSortingOptions.descendingOrder:
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
        break;
      case MenuSortingOptions.shortestToLongest:
        // TODO: Handle this case.
        break;
      case MenuSortingOptions.longestToShortest:
        // TODO: Handle this case.
        break;
    }
  }
}

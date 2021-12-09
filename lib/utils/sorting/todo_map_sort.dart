import 'dart:collection';

import 'package:to_do_list/ui/model/to_do_data_model.dart';

Map<String, ToDo> ascendingTodoMapSort(Map<String, ToDo>? toDos) {
  var entries = toDos!.entries.toList();
  entries.sort((MapEntry<String, ToDo> first, MapEntry<String, ToDo> second) =>
      first.value.text.compareTo(second.value.text));
  toDos = Map<String, ToDo>.fromEntries(entries);
  return toDos;
}

Map<String, ToDo> descendingTodoMapSort(Map<String, ToDo>? toDos) {
  var entries = toDos!.entries.toList();
  entries.sort((MapEntry<String, ToDo> second, MapEntry<String, ToDo> first) =>
      first.value.text.compareTo(second.value.text));
  toDos = Map<String, ToDo>.fromEntries(entries);
  return toDos;
}



import 'package:to_do_list/ui/model/to_do_data_model.dart';

Map<String, ToDo?> ascendingToDoSort(Map<String, ToDo> toDos) {
  var sortedKeys = toDos.keys.toList(growable: false)
    ..sort((key1, key2) => toDos[key1]!.text.compareTo(toDos[key2]!.text));
  var sortedMap = {for (var k in sortedKeys) k: toDos[k]};
  return sortedMap;
}

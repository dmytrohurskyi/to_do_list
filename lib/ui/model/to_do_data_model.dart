import 'package:localstore/localstore.dart';

class ToDo {
  final String id;
  String text;
  bool isCompleted;

  ToDo({required this.id, required this.text, required this.isCompleted});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'isCompleted': isCompleted,
    };
  }

  factory ToDo.fromMap(Map<String, dynamic> map) {
    return ToDo(
      id: map['id'],
      text: map['text'],
      isCompleted: map['isCompleted'],
    );
  }
}

extension ExtensionTodo on ToDo {
  Future save() async {
    final _db = Localstore.instance;
    return _db.collection('todos').doc(id).set(toMap());
  }

  Future delete() async {
    final _db = Localstore.instance;
    return _db.collection('todos').doc(id).delete();
  }
}
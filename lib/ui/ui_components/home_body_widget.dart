import 'package:flutter/material.dart';
import 'package:to_do_list/ui/ui_components/list_item_widget.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({Key? key}) : super(key: key);

  @override
  _HomeBodyWidgetState createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  List toDos = [];

  @override
  void initState() {
    super.initState();

    toDos.addAll(['Water plants', 'Feed dog', 'Drink water']);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: toDos.length,
      itemBuilder: (_, index) => Dismissible(
        key: Key(toDos[index]),
        child: ListItemWidget(textToShow: toDos[index]),
        background: Container(color: Colors.redAccent),
        onDismissed: (_) {
          setState(() {
            String deletedTask = toDos[index];
            toDos.removeAt(index);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text(
                'Task was deleted.',
                style: TextStyle(fontSize: 20),
              ),
              action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    setState(() {
                      toDos.add(deletedTask);
                    });
                  }),
            ));
          });
        },
      ),
    );
  }
}

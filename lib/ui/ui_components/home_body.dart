import 'package:flutter/material.dart';
import 'package:to_do_list/ui/ui_components/list_item.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
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
        child: ListItem(textToShow: toDos[index]),
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

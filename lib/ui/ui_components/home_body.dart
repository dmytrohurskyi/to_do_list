import 'package:flutter/material.dart';
import 'package:to_do_list/ui/ui_components/list_item.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List toDos = ['Water plants', 'Feed dog', 'Drink water'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: toDos.length,
        itemBuilder: (_, index) =>
          ListItem(textToShow: toDos[index]),
    );
  }
}

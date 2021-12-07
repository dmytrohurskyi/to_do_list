import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_MenuSortingOptions>(
      icon: const Icon(
        Icons.sort,
        size: 26,
      ),
      onSelected: (_MenuSortingOptions result) {
        switch (result) {
          case _MenuSortingOptions.ascendingOrder:
            // TODO: Handle this case.
            break;
          case _MenuSortingOptions.descendingOrder:
            // TODO: Handle this case.
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

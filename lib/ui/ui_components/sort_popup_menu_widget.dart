import 'dart:async';

import 'package:flutter/material.dart';

// This enum contains options that used as sorting filters down below
enum MenuSortingOptions {
  ascendingOrder,
  descendingOrder,
  shortestToLongest,
  longestToShortest
}

class SortPopupMenuWidget extends StatefulWidget {
  final Function(MenuSortingOptions) onSelect;

  const SortPopupMenuWidget({Key? key, required this.onSelect})
      : super(key: key);

  @override
  _SortPopupMenuWidgetState createState() => _SortPopupMenuWidgetState();
}

class _SortPopupMenuWidgetState extends State<SortPopupMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuSortingOptions>(
      icon: const Icon(
        Icons.sort,
        size: 26,
      ),
      onSelected: widget.onSelect,
      itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<MenuSortingOptions>>[
        const PopupMenuItem(
          value: MenuSortingOptions.ascendingOrder,
          child: Text('Sort in ascending order'),
          textStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
        const PopupMenuItem(
          value: MenuSortingOptions.descendingOrder,
          child: Text('Sort in descending order'),
          textStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
        const PopupMenuItem(
          value: MenuSortingOptions.longestToShortest,
          child: Text('Longest to shortest'),
          textStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
        const PopupMenuItem(
          value: MenuSortingOptions.shortestToLongest,
          child: Text('Shortest to longest'),
          textStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ],
    );
  }
}



import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/items/add_new_item.dart';

class AddNewList extends StatefulWidget {
  const AddNewList({Key? key}) : super(key: key);

  @override
  _AddNewListState createState() => _AddNewListState();
}

class _AddNewListState extends State<AddNewList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AddNewItem()
      ],
    );
  }
}

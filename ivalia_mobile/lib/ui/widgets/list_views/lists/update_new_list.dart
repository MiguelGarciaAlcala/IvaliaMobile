

import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/new.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/items/add_new_item.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/items/update_new_item.dart';

class UpdateNewList extends StatefulWidget {
  final New item;

  const UpdateNewList({required this.item,  Key? key}) : super(key: key);

  @override
  _UpdateNewListState createState() => _UpdateNewListState();
}

class _UpdateNewListState extends State<UpdateNewList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UpdateNewItem(item: widget.item)
      ],
    
    );
  }
}

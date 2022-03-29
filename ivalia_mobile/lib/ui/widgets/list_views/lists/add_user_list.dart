

import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/items/add_new_item.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/items/add_user_item.dart';

class AddUserList extends StatefulWidget {
  const AddUserList({Key? key}) : super(key: key);

  @override
  _AddUserListState createState() => _AddUserListState();
}

class _AddUserListState extends State<AddUserList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AddUserItem()
      ],
    );
  }
}

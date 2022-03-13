

import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/user.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/items/detail_user_item.dart';

class DetailUserList extends StatelessWidget {
  final User items;
  const DetailUserList({required this.items,  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DetailUserListItem(item: items)
      ],
    );//itemCount: items.,
        //itemBuilder: (context, index) => DetailUserListItem(item: items));
  }
}


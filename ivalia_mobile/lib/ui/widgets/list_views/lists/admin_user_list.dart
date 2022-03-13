import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/logged_user.dart';
import 'package:ivalia_mobile/api/models/view/user.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/items/admin_user_item.dart';
import 'package:ivalia_mobile/ui/widgets/pages/myprofile_page.dart';

class AdminUserList extends StatelessWidget {
  final List<User> items;
  final RefreshCallback onRefresh;

  const AdminUserList({required this.items, required this.onRefresh, Key? key})
      : super(key: key);

  //const AdminUserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.builder(
            clipBehavior: Clip.antiAlias,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, i) => AdminUserListItem(item: items[i])
        )
    );
  }
}



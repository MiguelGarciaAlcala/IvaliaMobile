

import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/logged_user.dart';
import 'package:ivalia_mobile/api/models/view/logged_user_act.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/items/admin_user_item.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/items/my_profile_item.dart';

class MyProfilelist extends StatelessWidget {
  final List<LoggedUserAct> items;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  const MyProfilelist({required this.items,required this.usernameController,
    required this.passwordController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) =>
            MyProfileItem(items: items[index],passwordController: passwordController,
                            usernameController: usernameController,) );
    /*return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => AdminUserListItem(item: item),);
  }  */
  }
}

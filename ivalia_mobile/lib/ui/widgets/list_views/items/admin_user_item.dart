import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/logged_user.dart';
import 'package:ivalia_mobile/api/models/view/user.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:ivalia_mobile/ui/widgets/pages/detail_user_page.dart';

class AdminUserListItem extends StatelessWidget {
  final User item;

  //AdminUserListItem({required this.item})
  AdminUserListItem({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(5),
      child: ListTile(
        title: Text(item.Fullname),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(item.Email), Text('prueba')],
        ),
        leading: CircleAvatar(
          maxRadius: 30,
          minRadius: 20,
          child: Image.network(item.LogourlUser),
        ),
        trailing: IconButton(
            onPressed: () {
              print('delete');
            },
            icon: Icon(Icons.delete)),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailUserPage(items: item)));
        },
        //Icon(Icons.arrow_forward),
      ),
    );
  }
}

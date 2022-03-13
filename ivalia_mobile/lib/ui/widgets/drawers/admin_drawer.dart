import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/items/admin_user_item.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/lists/admin_user_list.dart';
import 'package:ivalia_mobile/ui/widgets/pages/admin_users_page.dart';
import 'package:ivalia_mobile/ui/widgets/pages/myprofile_page.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

class AdminDrawer extends StatefulWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  _AdminDrawerState createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiLevelDrawer(
      backgroundColor: ColorStyles.white,
      rippleColor: ColorStyles.white,
      subMenuBackgroundColor: ColorStyles.white,
      header: Container(
        color: ColorStyles.darkBlue,
        height: size.height * 0.25,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/logo_blanco.jpg",
              width: 100,
              height: 100,
            )
          ],
        )),
      ),
      children: [
        MLMenuItem(
            leading: Icon(Icons.account_circle),
            content: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Mi perfil"),
            ),
            onClick: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const MyProfilePage()
                  )
              );
            }),
        MLMenuItem(
          leading: Icon(Icons.supervised_user_circle_outlined),
            content: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Usuarios"),
            ),
            onClick: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => AdminUserPage()
                  )
              );
            }),
        MLMenuItem(
            //leading: Icon(Icons.account_circle),
            content: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(""),
            ),
            onClick: () {})
      ],
    );



  }
}
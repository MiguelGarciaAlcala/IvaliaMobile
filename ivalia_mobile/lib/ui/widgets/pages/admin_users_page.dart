import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/ivalia_api.dart';
import 'package:ivalia_mobile/api/models/view/logged_user.dart';
import 'package:ivalia_mobile/api/models/view/user.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/lists/admin_user_list.dart';

class AdminUserPage extends StatefulWidget {
  const AdminUserPage({Key? key}) : super(key: key);

  @override
  _AdminUserPageState createState() => _AdminUserPageState();
}

class _AdminUserPageState extends State<AdminUserPage> {
  late List<User> users;

  Future<void> loadUsers() async {
    setState(() {
      users = [
        User(Roleid: 1,Fullname: 'Victor Alejandro Chavez',Email: 'Correo@correo.com',
            Password: '****',Username: 'victor',ProfilePicture: 'Logo',Status: 'activo', LogourlUser: 'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
        User(Roleid: 1,Fullname: 'Victor Alejandro Chavez',Email: 'Correo@correo.com',
            Password: '****',Username: 'victor',ProfilePicture: 'Logo',Status: 'activo', LogourlUser: 'https://picsum.photos/250?image=9'),
        User(Roleid: 1,Fullname: 'Victor Alejandro Chavez',Email: 'Correo@correo.com',
            Password: '****',Username: 'victor',ProfilePicture: 'Logo',Status: 'activo', LogourlUser: 'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
        User(Roleid: 1,Fullname: 'Victor Alejandro Chavez',Email: 'Correo@correo.com',
            Password: '****',Username: 'victor',ProfilePicture: 'Logo',Status: 'activo', LogourlUser: 'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),

      ];
    });
  }

  @override
  void initState() {
    loadUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar(title: "Usuarios",actions: [
        Icon(Icons.search),
      ],),
      body: AdminUserList(items: users,onRefresh: loadUsers),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: ColorStyles.darkBlue,
        child: const Icon(Icons.add),
      ),

    );
  }
}

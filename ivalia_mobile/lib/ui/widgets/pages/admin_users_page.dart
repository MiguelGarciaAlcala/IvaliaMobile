import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/ivalia_api.dart';
import 'package:ivalia_mobile/api/models/view/logged_user.dart';
import 'package:ivalia_mobile/api/models/view/user.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/lists/admin_user_list.dart';
import 'package:ivalia_mobile/ui/widgets/pages/add_user_page.dart';

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
        User(Roleid: 1,Fullname: 'Luis Miguel',Email: 'Correo@correo.com',
            Password: '****',Username: 'LuisMi',ProfilePicture: 'Logo',Status: 'activo', LogourlUser: 'https://picsum.photos/250?image=9'),
        User(Roleid: 1,Fullname: 'Jonn Deere',Email: 'Correo@correo.com',
            Password: '****',Username: 'JohnD',ProfilePicture: 'Logo',Status: 'activo', LogourlUser: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGO7ukD1-XNgYoAglXYWjGuYQPmlJLKN_vDENABjD2U9j0Dw5kMjXFCsNCwEpRXzirb7k&usqp=CAU'),
        User(Roleid: 1,Fullname: 'Victor Alejandro Chavez',Email: 'Correo@correo.com',
            Password: '****',Username: 'victor',ProfilePicture: 'Logo',Status: 'activo', LogourlUser: 'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
        User(Roleid: 1,Fullname: 'Victor Alejandro Chavez',Email: 'Correo@correo.com',
            Password: '****',Username: 'victor',ProfilePicture: 'Logo',Status: 'activo', LogourlUser: 'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
        User(Roleid: 1,Fullname: 'Victor Alejandro Chavez',Email: 'Correo@correo.com',
            Password: '****',Username: 'victor',ProfilePicture: 'Logo',Status: 'activo', LogourlUser: 'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
        User(Roleid: 1,Fullname: 'Juan Alejandro Chavez',Email: 'Correo@correo.com',
            Password: '****',Username: 'victor',ProfilePicture: 'Logo',Status: 'activo', LogourlUser: 'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
        User(Roleid: 1,Fullname: 'Pedro Alejandro Chavez',Email: 'Correo@correo.com',
            Password: '****',Username: 'victor',ProfilePicture: 'Logo',Status: 'activo', LogourlUser: 'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
        User(Roleid: 1,Fullname: 'Alejandro Alejandro Chavez',Email: 'Correo@correo.com',
            Password: '****',Username: 'victor',ProfilePicture: 'Logo',Status: 'activo', LogourlUser: 'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
        User(Roleid: 1,Fullname: 'Raul Alejandro Chavez',Email: 'Correo@correo.com',
            Password: '****',Username: 'victor',ProfilePicture: 'Logo',Status: 'activo', LogourlUser: 'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
        User(Roleid: 1,Fullname: 'Arturo Alejandro Chavez',Email: 'Correo@correo.com',
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
      appBar: PageBar(title: "Usuarios"),
      body: AdminUserList(items: users,onRefresh: loadUsers),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => AddUserPage()
              )
          );
        },
        backgroundColor: ColorStyles.darkBlue,
        child: const Icon(Icons.add),
      ),

    );
  }
}

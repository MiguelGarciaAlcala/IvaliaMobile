import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/pages/admin_downloads_page.dart';
import 'package:ivalia_mobile/ui/widgets/pages/admin_links_page.dart';
import 'package:ivalia_mobile/ui/widgets/pages/admin_news_page.dart';
import 'package:ivalia_mobile/ui/widgets/pages/admin_users_page.dart';
import 'package:ivalia_mobile/ui/widgets/pages/home_page.dart';
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
            leading: const Icon(Icons.account_circle),
            content: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Mi perfil"),
            ),
            onClick: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyProfilePage()));
            }),
        MLMenuItem(
            leading: const Icon(Icons.public),
            trailing: Icon(Icons.arrow_right),
            content: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Publico"),
            ),
            onClick: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyProfilePage()));
            },
            subMenuItems: [
              MLSubmenu(onClick: () {}, submenuContent: Text("Secciones")),
              MLSubmenu(onClick: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminNewsPage()));
              }, submenuContent: Text("Noticias")),
              MLSubmenu(onClick: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminLinksPage()));

              }, submenuContent: Text("Enlaces")),
              MLSubmenu(onClick: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminDownloadsPage()));

              }, submenuContent: Text("Descargables")),
            ]),
        MLMenuItem(
            leading: const Icon(Icons.bar_chart),
            content: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Estadisticas"),
            ),
            onClick: () {
              //Navigator.pop(context);
              //Navigator.push(context,
              //  MaterialPageRoute(builder: (context) => AdminUserPage()));
            }),
        MLMenuItem(
            leading: const Icon(Icons.folder),
            content: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Documentos"),
            ),
            onClick: () {
              //Navigator.pop(context);
              //Navigator.push(context,
              //  MaterialPageRoute(builder: (context) => AdminUserPage()));
            }),
        MLMenuItem(
            leading: const Icon(Icons.supervised_user_circle_outlined),
            content: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Clientes"),
            ),
            onClick: () {
              //Navigator.pop(context);
              //Navigator.push(context,
              //  MaterialPageRoute(builder: (context) => AdminUserPage()));
            }),
        MLMenuItem(
            leading: const Icon(Icons.supervised_user_circle_outlined),
            content: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Usuarios"),
            ),
            onClick: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminUserPage()));
            }),
        MLMenuItem(
            leading: const Icon(Icons.exit_to_app),
            content: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Cerrar Sesion"),
            ),
            onClick: () {
              Navigator.pop(context);
               Navigator.push(context,
                 MaterialPageRoute(builder: (context) => HomePage()));
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

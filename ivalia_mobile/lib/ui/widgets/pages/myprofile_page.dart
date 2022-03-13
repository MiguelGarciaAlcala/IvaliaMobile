import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/logged_user.dart';
import 'package:ivalia_mobile/api/models/view/logged_user_act.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/lists/my_profile_list.dart';
import 'package:ivalia_mobile/ui/widgets/text_fields/text_input_field.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late bool _validUsername;
  late bool _validPassword;
  late bool _isVisible;
  late bool _isEnabled = false;

  late List<LoggedUserAct> userLog;


  Future<void> LoadUserlog() async{
    setState(() {
      userLog = [
        LoggedUserAct(id: 1,fullname: 'Victor Alejandro',pass: 'Pass123',role: 'A',
            token: 'kasjkajskasjas',LogourlUser: 'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4')
      ];
    });
  }

  @override
  void initState() {
    LoadUserlog();
    super.initState();
    _usernameController = TextEditingController();
    _usernameController.text = 'Correo@correo.com';
    _passwordController = TextEditingController();
    _passwordController.text = 'Contraseña';
    _validUsername = true;
    _validPassword = true;
    _isVisible = true;




  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: PageBar(title: 'Mi Perfil'),
       body: MyProfilelist(items: userLog,usernameController: _usernameController,
                            passwordController: _passwordController),
      );
  }
}

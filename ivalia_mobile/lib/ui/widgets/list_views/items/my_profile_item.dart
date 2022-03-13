import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/logged_user.dart';
import 'package:ivalia_mobile/api/models/view/logged_user_act.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';

class MyProfileItem extends StatelessWidget {
  final LoggedUserAct items;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const MyProfileItem({required this.items,required this.passwordController,
                        required this.usernameController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late bool _validUsername;
    late bool _validPassword;
    late bool _isVisible = true;
    late bool _isEnabled = false;

    return Column(
      children: [
        Container(
          height: 250,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [ColorStyles.darkBlue, ColorStyles.darkBlue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.5, 0.9],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CircleAvatar(
                      backgroundColor: Colors.white70,
                      maxRadius: 70,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        maxRadius: 60,
                        backgroundImage: NetworkImage(items.LogourlUser),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                items.fullname,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              //user name
              Text(
                items.role,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            PaddedWidget.only(
              right: 10,
              left: 10,
              top: 30,
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      'Email',
                      style: TextStyle(
                        color: ColorStyles.darkBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: TextField(
                      //enabled: false,
                      controller: usernameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ingresa tu correo',
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: const Text(
                      'Contraseña',
                      style: TextStyle(
                        color: ColorStyles.darkBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: TextField(
                      //enabled: _isEnabled,
                      controller: passwordController,
                      //errorText: _validPassword ? null : 'Contraseña requerida',
                      obscureText: _isVisible,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Ingresa tu contraseña',
                          suffixIcon: GestureDetector(
                              onTap: () {
                                _isVisible = !_isVisible;
                              },
                              child: Icon(
                                  _isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: ColorStyles.darkGrey))),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ColorStyles.lightGrey,
                    ),
                    child: const Text(
                      'Actualizar',
                      style: TextStyle(color: ColorStyles.black),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

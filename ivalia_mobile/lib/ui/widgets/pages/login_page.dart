import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/ivalia_api.dart';
import 'package:ivalia_mobile/api/models/request/user_login_request.dart';
import 'package:ivalia_mobile/api/models/request/user_recovery_request.dart';
import 'package:ivalia_mobile/api/models/view/logged_user.dart';
import 'package:ivalia_mobile/tools/hash_manager.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/styles/fonts.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/dialogs/message_dialog.dart';
import 'package:ivalia_mobile/ui/widgets/dialogs/user_recovery_dialog.dart';
import 'package:ivalia_mobile/ui/widgets/pages/admin_home_page.dart';
import 'package:ivalia_mobile/ui/widgets/pages/client_home_page.dart';
import 'package:ivalia_mobile/ui/widgets/text_fields/text_input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late bool _validUsername;
  late bool _validPassword;
  late bool _isVisible;

  @override
  void initState() {
    super.initState();

    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
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
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg_login.jpeg'),
                    fit: BoxFit.cover,
                  )
              ),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.fromLTRB(30, 80, 20, 10),
                      child: Image.asset('assets/images/logo_blanco.jpg')
                  ),
                  PaddedWidget.only(
                      right: 40, left: 40, top: 80,
                      child: Column(
                        children: [
                          TextInputField(
                            hint: 'Usuario',
                            controller: _usernameController,
                            errorText: _validUsername ? null : 'Usuario requerido',
                            prefixIcon: const Icon(
                                Icons.account_circle,
                                color: ColorStyles.darkGrey
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextInputField(
                            hint: 'Contraseña',
                            controller: _passwordController,
                            errorText: _validPassword ? null : 'Contraseña requerida',
                            obscureText: _isVisible,
                            prefixIcon: const Icon(
                                Icons.lock,
                                color: ColorStyles.darkGrey
                            ),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                  });
                                },
                                child: Icon(
                                    _isVisible ? Icons.visibility : Icons.visibility_off,
                                    color: ColorStyles.darkGrey
                                )
                            )
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            child: const Text(
                              'Iniciar Sesion',
                              style: TextStyle(color: ColorStyles.black),
                            ),
                            onPressed: () async {
                              final username = _usernameController.text.trim();
                              final password = _passwordController.text;

                              setState(() {
                                _validUsername = username.isNotEmpty;
                                _validPassword = password.isNotEmpty;
                              });

                              if(username.isNotEmpty && password.isNotEmpty) {
                                final loginRequest = UserLoginRequest(
                                    username: username, 
                                    hashedPassword: HashManager.sha256(password)
                                );

                                final response = await IvaliaAPI.instance.users.login(loginRequest);

                                if(response.isSuccessful()) {
                                  final loggedUser = LoggedUser.fromJson(response.data as Map<String, dynamic>);
                                  home(loggedUser);
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) => MessageDialog(
                                      title: "Error",
                                      content: response.messages!,
                                    )
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xffb3b3b3),
                                minimumSize: const Size.fromHeight(60)
                            )
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(bottom: 20),
                            child: GestureDetector(
                              child: Text(
                                '¿Olvidaste tu contraseña?',
                                style: FontStyles.small.copyWith(color: ColorStyles.white),
                              ),
                              onTap: () async {
                                final request = await recoveryDialog();

                                if(request != null) {
                                  final response = await IvaliaAPI.instance.users.recovery(request);

                                  showDialog(
                                    context: context,
                                    builder: (context) => MessageDialog(
                                      title: 'Recuperar Contraseña',
                                      content: response.messages!,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      )
                  )
                ],
              ),
            )
          )
        ],
      )
    );
  }

  Future<UserRecoveryRequest?> recoveryDialog() {
    return showDialog<UserRecoveryRequest>(
        context: context,
        builder: (context) => UserRecoveryDialog(
          onRecovery: (UserRecoveryRequest request) {
            Navigator.of(context).pop(request);
          },
        )
    );
  }

  void home(LoggedUser loggedUser) {
    switch(loggedUser.role) {
      case RoleType.admin:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminHomePage()));
        break;
      case RoleType.client:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ClientHomePage()));
        break;
      default:
        showDialog(
          context: context,
          builder: (context) => const MessageDialog(
            title: 'Usuario no válido',
            content: 'El usuario tiene un rol de acceso desconocido.',
          )
        );
        break;
    }
  }
}

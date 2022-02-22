import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/request/user_recovery_request.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/text_fields/text_input_field.dart';

class UserRecoveryDialog extends StatefulWidget {
  final Function onRecovery;
  const UserRecoveryDialog({required this.onRecovery, Key? key}) : super(key: key);

  @override
  _UserRecoveryDialogState createState() => _UserRecoveryDialogState();
}

class _UserRecoveryDialogState extends State<UserRecoveryDialog> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  bool _validUsername = true;
  bool _validEmail = true;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Recuperar Contraseña'),
      content: PaddedWidget.only(
        top: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextInputField(
              hint: 'Usuario',
              controller: _usernameController,
              errorText: !_validUsername ? 'Usuario requerido' : null,
              autofocus: true,
              prefixIcon: const Icon(
                  Icons.account_circle,
                  color: ColorStyles.darkGrey
              ),
            ),
            const SizedBox(height: 15),
            TextInputField(
              hint: 'Correo',
              controller: _emailController,
              errorText: !_validEmail ? 'Correo requerido' : null,
              prefixIcon: const Icon(
                  Icons.email,
                  color: ColorStyles.darkGrey
              ),
            )
          ],
        )
      ),
      actions: [
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('Aceptar'),
          onPressed: () {
            final username = _usernameController.text.trim();
            final email = _emailController.text.trim();

            setState(() {
              _validUsername = username.isNotEmpty;
              _validEmail = email.isNotEmpty;
            });

            if(username.isNotEmpty && email.isNotEmpty) {
              widget.onRecovery(UserRecoveryRequest(username: username, email: email));
            }
          },
        ),
      ],
    );
  }
}
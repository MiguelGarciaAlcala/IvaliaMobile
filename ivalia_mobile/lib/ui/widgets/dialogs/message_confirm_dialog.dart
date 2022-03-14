import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';

class MessageConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  const MessageConfirmDialog({Key? key, required this.title, required this.content,required this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      title: Text(title),
      content: SingleChildScrollView(
        child: Text(content),
      ),
      actions: actions,
      /*[
        TextButton(
          child: const Text(
            'Cancelar',
            softWrap: true,
            style: TextStyle(
              color: ColorStyles.darkBlue
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text(
            'Aceptar',
            softWrap: true,
            style: TextStyle(
                color: ColorStyles.darkBlue
            ),
          ),
          onPressed: () => Navigator.pop(context),
        )

      ],*/
    );
  }
}
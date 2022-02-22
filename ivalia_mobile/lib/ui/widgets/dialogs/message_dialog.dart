import 'package:flutter/material.dart';

class MessageDialog extends StatelessWidget {
  final String title;
  final String content;

  const MessageDialog({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Text(content),
      ),
      actions: [
        TextButton(
          child: const Text(
            'Aceptar',
            softWrap: true,
          ),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
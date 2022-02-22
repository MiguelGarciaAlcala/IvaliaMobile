import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar(),
      body: Container(
        child: const Text('Administrador'),
        alignment: Alignment.center,
      )
    );
  }
}
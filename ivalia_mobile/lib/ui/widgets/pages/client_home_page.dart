import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:ivalia_mobile/ui/widgets/drawers/client_drawer.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar(),
      drawer: ClientDrawer(),
      body: Container(
        child: const Text('Cliente'),
        alignment: Alignment.center,
      )
    );
  }
}
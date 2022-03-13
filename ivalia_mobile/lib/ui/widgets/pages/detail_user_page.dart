
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/user.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/lists/detail_user_list.dart';

class DetailUserPage extends StatelessWidget {
  final  User items;
  const DetailUserPage({required this.items,  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PageBar(title: 'Perfil de Usuario'),
        body: DetailUserList(items: items,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: ColorStyles.darkBlue,
        child: const Icon(Icons.save),
      ),

    );
  }
}


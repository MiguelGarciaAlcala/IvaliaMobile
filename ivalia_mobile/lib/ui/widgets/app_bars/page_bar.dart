import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/styles/fonts.dart';

class PageBar extends AppBar {
  PageBar({Key? key, String title = 'Ivalia Móvil', List<Widget>? actions}) : super(
      key: key,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: FontStyles.huge.copyWith(color: ColorStyles.white),
      ),
      centerTitle: true,

      elevation: 5,
      actions: actions,
      automaticallyImplyLeading: true,
      backgroundColor: ColorStyles.darkBlue
  );
}
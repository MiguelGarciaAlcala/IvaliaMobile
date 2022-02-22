import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/section.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/styles/fonts.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:url_launcher/url_launcher.dart';

class SectionPage extends StatelessWidget {
  final String page;
  final Section item;

  const SectionPage({this.page = 'Ivalia Móvil', required this.item, Key? key}) : super(key: key);

  Widget? fab() {
    if (item.title == 'Contacto') {
      const mapUrl = "https://www.google.com/maps/dir//Ivalia,+SC+Prol.+Suiza+28+La+Luneta+59680+Zamora+de+Hidalgo,+Mich./@19.9751416,-102.2899919,16z/data=!4m8!4m7!1m0!1m5!1m1!1s0x842e8904772a1a29:0x4999cce8c33c90dc!2m2!1d-102.2899919!2d19.9751416";

      return FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: const Icon(
            Icons.assistant_navigation,
            color: ColorStyles.darkBlue,
            size: 60.0,
          ),
          onPressed: () {
            launch(mapUrl);
          }
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar(title: page),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_login.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
                child: Text(
                    item.title,
                    style: FontStyles.huge.copyWith(color: ColorStyles.white)
                )
            ),
            //color: Colors.white,
          ),
          Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: PaddedWidget.only(
                  left: 15,
                  right: 15,
                  top: 30,
                  bottom: 30,
                  child: Text(
                    item.content!,
                    style: FontStyles.big.copyWith(color: ColorStyles.darkerGrey),
                    textAlign: TextAlign.center,
                  ),
                )
            ),
          ),
        ],
      ),
      floatingActionButton: fab(),
    );
  }
}

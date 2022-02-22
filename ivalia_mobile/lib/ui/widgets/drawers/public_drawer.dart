import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/ivalia_api.dart';
import 'package:ivalia_mobile/api/models/view/section.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/styles/fonts.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/pages/downloads_page.dart';
import 'package:ivalia_mobile/ui/widgets/pages/links_page.dart';
import 'package:ivalia_mobile/ui/widgets/pages/section_page.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

class PublicDrawer extends StatefulWidget {
  const PublicDrawer({Key? key}) : super(key: key);

  @override
  _PublicDrawerState createState() => _PublicDrawerState();
}

class _PublicDrawerState extends State<PublicDrawer> {

  List<MLMenuItem> getSections(BuildContext context, List<Section> sections) {
    var sectionList = sections.map((item) {
      final subsections = getSubsections(context, item);

      return MLMenuItem(
        trailing: subsections.isNotEmpty ? const Icon(Icons.arrow_right) : null,
        content: PaddedWidget.only(
          left: 10,
          child: Text(
            item.title,
            style: FontStyles.medium.copyWith(color: ColorStyles.darkerGrey),
          )
        ),
        onClick: () {
          if(item.content != null) {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SectionPage(
                      page: 'Ivalia Móvil',
                      item: item,
                    )
                )
            );
          }
        },
        subMenuItems: subsections.isNotEmpty ? subsections : null
      );
    }).toList();

    sectionList.add(MLMenuItem(
        content: PaddedWidget.only(
          left: 10,
          child: Text(
            "Enlaces Externos",
            style: FontStyles.medium.copyWith(color: ColorStyles.darkerGrey),
          ),
        ),
        onClick: () {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => const LinksPage()
              )
          );
        }
    ));

    sectionList.add(MLMenuItem(
        content: PaddedWidget.only(
          left: 10,
          child: Text(
            "Descargables",
            style: FontStyles.medium.copyWith(color: ColorStyles.darkerGrey),
          ),
        ),
        onClick: () {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DownloadsPage()
              )
          );
        }
    ));

    sectionList.add(MLMenuItem(
      content: const Text(''),
      onClick: () {},
    ));

    return sectionList;
  }

  List<MLSubmenu> getSubsections(BuildContext context, Section section) {
    return (section.subsections != null) ? section.subsections!.map((item) => MLSubmenu(
      submenuContent: PaddedWidget.horizontal(
          padding: 5,
          child: Text(
            item.title,
            style: FontStyles.medium.copyWith(color: ColorStyles.darkerGrey),
          )
      ),
      onClick: () {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SectionPage(
                  page: section.title,
                  item: Section(
                    title: item.title,
                    content: item.content
                  ),
                )
            )
        );
      }
    )).toList() : [];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: IvaliaAPI.instance.sections.public(),
      builder: (contextFuture, snapshot) {
        var sectionMenus = <MLMenuItem>[];

        if(snapshot.hasData) {
          final sectionList = snapshot.data as List<Section>;

          if(sectionList.isNotEmpty) {
            sectionMenus = getSections(context, sectionList);
          }
        } else {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
            height: size.height
          );
        }

        if(sectionMenus.isEmpty) {
          final sectionList = IvaliaAPI.instance.sections.defaultPublic();
          sectionMenus = getSections(context, sectionList);
        }

        return MultiLevelDrawer(
          backgroundColor: ColorStyles.white,
          rippleColor: ColorStyles.white,
          subMenuBackgroundColor: ColorStyles.white,
          header: Container(
            color: ColorStyles.darkBlue,
            height: size.height * 0.25,
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/logo_blanco.jpg",
                      width: 100,
                      height: 100,
                    )
                  ],
                )),
          ),
          children: sectionMenus,
        );
      },
    );
  }
}
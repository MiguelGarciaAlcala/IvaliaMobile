import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/ivalia_api.dart';
import 'package:ivalia_mobile/api/models/view/link_resource.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:ivalia_mobile/ui/widgets/common/no_content.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/lists/public_links_list.dart';

class LinksPage extends StatefulWidget {
  const LinksPage({Key? key}) : super(key: key);

  @override
  _LinksPageState createState() => _LinksPageState();
}

class _LinksPageState extends State<LinksPage> {
  late Future<List<LinkResource>> links;

  Future<void> loadLinks() async {
    setState(() {
      links = IvaliaAPI.instance.resources.publicLinks();
    });
  }

  @override
  void initState() {
    loadLinks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PageBar(title: 'Enlaces Externos'),
      body: FutureBuilder(
        future: links,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            final links = snapshot.data as List<LinkResource>;

            if(links.isNotEmpty) {
              return PublicLinksList(
                items: links,
                onRefresh: loadLinks,
              );
            }
          }

          return NoContent(onRefresh: loadLinks);
        },
      )
    );
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then((onGoBack));
  }
}

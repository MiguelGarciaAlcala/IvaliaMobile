import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/ivalia_api.dart';
import 'package:ivalia_mobile/api/models/view/link_resource.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:ivalia_mobile/ui/widgets/common/no_content.dart';
import 'package:ivalia_mobile/ui/widgets/dialogs/add_link_dialog.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/lists/admin_links_list.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/lists/public_links_list.dart';

class AdminLinksPage extends StatefulWidget {
  const AdminLinksPage({Key? key}) : super(key: key);

  @override
  _AdminLinksPageState createState() => _AdminLinksPageState();
}

class _AdminLinksPageState extends State<AdminLinksPage> {
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
          if (snapshot.hasData) {
            final links = snapshot.data as List<LinkResource>;

            if (links.isNotEmpty) {
              return AdminLinksList(
                items: links,
                onRefresh: loadLinks,
              );
            }
          }
          return NoContent(onRefresh: loadLinks);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            barrierColor: Colors.black54.withOpacity(0.6),
            context: context,
            builder: (context) => AddLinkDialog(title: 'Nuevo Enlace'),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: ColorStyles.darkBlue,
      ),
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

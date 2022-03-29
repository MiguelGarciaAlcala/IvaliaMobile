import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/ivalia_api.dart';
import 'package:ivalia_mobile/api/models/view/file_resource.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:ivalia_mobile/ui/widgets/common/no_content.dart';
import 'package:ivalia_mobile/ui/widgets/dialogs/add_download_dialog.dart';
import 'package:ivalia_mobile/ui/widgets/dialogs/add_link_dialog.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/lists/admin_files_list.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/lists/public_files_list.dart';

class AdminDownloadsPage extends StatefulWidget {
  const AdminDownloadsPage({Key? key}) : super(key: key);

  @override
  _AdminDownloadsPagePageState createState() => _AdminDownloadsPagePageState();
}

class _AdminDownloadsPagePageState extends State<AdminDownloadsPage> {
  late Future<List<FileResource>> files;

  Future<void> loadFiles() async {
    setState(() {
      files = IvaliaAPI.instance.resources.publicFiles();
    });
  }

  @override
  void initState() {
    loadFiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PageBar(title: 'Descargables'),
        body: FutureBuilder(
          future: files,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              final files = snapshot.data as List<FileResource>;

              if(files.isNotEmpty) {
                return AdminFilesList(
                  items: files,
                  onRefresh: loadFiles,
                );
              }
            }

            return NoContent(onRefresh: loadFiles);
          },
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
      showDialog(
        barrierColor: Colors.black54.withOpacity(0.6),
        context: context,
        builder: (context) => AddDownloadDialog(title: 'Nuevo Descargable'),
      );
    },
    child: Icon(Icons.add),
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
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/ivalia_api.dart';
import 'package:ivalia_mobile/api/models/view/file_resource.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:ivalia_mobile/ui/widgets/common/no_content.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/lists/public_files_list.dart';

class DownloadsPage extends StatefulWidget {
  const DownloadsPage({Key? key}) : super(key: key);

  @override
  _DownloadsPagePageState createState() => _DownloadsPagePageState();
}

class _DownloadsPagePageState extends State<DownloadsPage> {
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
                return PublicFilesList(
                  items: files,
                  onRefresh: loadFiles,
                );
              }
            }

            return NoContent(onRefresh: loadFiles);
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
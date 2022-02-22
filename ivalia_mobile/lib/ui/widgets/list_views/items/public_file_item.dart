import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/file_resource.dart';
import 'package:ivalia_mobile/tools/download_manager.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/styles/fonts.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

class PublicFileItem extends StatelessWidget {
  final FileResource item;
  const PublicFileItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddedWidget.all(
      padding: 8.0,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)
            ),
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            shadowColor: ColorStyles.black,
            primary: ColorStyles.darkerGrey,
            textStyle: FontStyles.large,
            backgroundColor: ColorStyles.lightGrey,
            elevation: 10,
            side: const BorderSide(
                color: ColorStyles.darkGrey,
                width: 2
            )
        ),
        onPressed: () {
          DownloadManager.downloadFile(item.resource, item.filename).then((path) {
            if(path != null) OpenFile.open(path);
          }).catchError((error) {});
        },
        icon: const Icon(Icons.download_rounded),
        label: Text(
          item.description,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
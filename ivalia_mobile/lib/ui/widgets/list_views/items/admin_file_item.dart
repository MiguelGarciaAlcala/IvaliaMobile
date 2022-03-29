import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/file_resource.dart';
import 'package:ivalia_mobile/tools/download_manager.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/styles/fonts.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/dialogs/update_download_dialog.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminFileItem extends StatefulWidget {
  final FileResource item;
  const AdminFileItem(this.item, {Key? key}) : super(key: key);

  @override
  State<AdminFileItem> createState() => _AdminFileItemState();
}

class _AdminFileItemState extends State<AdminFileItem> {
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
          DownloadManager.downloadFile(widget.item.resource, widget.item.filename).then((path) {
            if(path != null) OpenFile.open(path);
          }).catchError((error) {});
        },
        onLongPress: () {
          showMenu(
              context: context,
              position: RelativeRect.fromLTRB(60.0, 40.0, 100.0, 100.0),
              //RelativeRect.fromLTRB(
              //  w / 2, y + h + 20, w / 2, 0), // RelativeRect.fromLTRB(60.0, 40.0, 100.0, 100.0),
              items: [
                PopupMenuItem(
                  value: 1,
                  child: Text('Borrar'),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text('Actualizar'),
                  onTap: () async {
                    final navigator = Navigator.of(context);
                    await Future.delayed(Duration.zero);
                    showDialog(
                      barrierColor: Colors.black54.withOpacity(0.6),
                      context: context,
                      builder: (context) => UpdateDownloadDialog(title: 'Editar Descargable',item: widget.item,),
                    );
                  },
                ),
              ]);
        },
        icon: const Icon(Icons.download_rounded),
        label: Text(
          widget.item.description,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
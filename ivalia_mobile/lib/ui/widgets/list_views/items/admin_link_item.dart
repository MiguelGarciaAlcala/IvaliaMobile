import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/link_resource.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/styles/fonts.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/dialogs/add_link_dialog.dart';
import 'package:ivalia_mobile/ui/widgets/dialogs/update_link_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminLinkItem extends StatefulWidget {
  final LinkResource item;

  const AdminLinkItem(this.item, {Key? key}) : super(key: key);

  @override
  State<AdminLinkItem> createState() => _AdminLinkItemState();
}

class _AdminLinkItemState extends State<AdminLinkItem> {
  @override
  Widget build(BuildContext context) {
    return PaddedWidget.all(
      padding: 8.0,
      child: Column(
        children: [
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                padding: const EdgeInsets.all(15),
                alignment: Alignment.center,
                shadowColor: ColorStyles.black,
                primary: ColorStyles.darkerGrey,
                textStyle: FontStyles.large,
                backgroundColor: ColorStyles.lightGrey,
                elevation: 10,
                side: const BorderSide(color: ColorStyles.darkGrey, width: 2)),
            onPressed: () {
              launch(widget.item.hyperlink);
            },
            onLongPress: () {
              showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(60.0, 40.0, 100.0, 100.0),
                  //RelativeRect.fromLTRB(
                  //  w / 2, y + h + 20, w / 2, 0), // RelativeRect.fromLTRB(60.0, 40.0, 100.0, 100.0),
                  items: [
                    const PopupMenuItem(
                      value: 1,
                      child: Text('Borrar'),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: const Text('Actualizar'),
                      onTap: () async {
                        final navigator = Navigator.of(context);
                        await Future.delayed(Duration.zero);
                        showDialog(
                          barrierColor: Colors.black54.withOpacity(0.6),
                          context: context,
                          builder: (context) => UpdateLinkDialog(title: 'Editar Enlace',item: widget.item,),
                        );
                      },
                    ),
                  ]);
            },
            label: Text(
              widget.item.description,
              textAlign: TextAlign.center,
            ),
            icon: Row(
              children: [
                const Icon(Icons.link),
              ],
    ),


          ),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/new.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/styles/fonts.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/common/pdf_viewer.dart';
import 'package:ivalia_mobile/ui/widgets/dialogs/add_link_dialog.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/lists/update_new_list.dart';
import 'package:ivalia_mobile/ui/widgets/pages/update_new_page.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminNewItem extends StatefulWidget {
  final New item;
  final int index;

  const AdminNewItem(this.item, this.index, {Key? key}) : super(key: key);

  @override
  State<AdminNewItem> createState() => _AdminNewItemState();
}

class _AdminNewItemState extends State<AdminNewItem> {
  late Offset tapXY;

  // ↓ hold screen size, using first line in build() method
  late RenderBox overlay;

  RelativeRect get relRectSize =>
      RelativeRect.fromSize(tapXY & const Size(40, 40), overlay.size);

  void getPosition(TapDownDetails detail) {
    tapXY = detail.globalPosition;
  }

  @override
  Widget build(BuildContext context) {
    return PaddedWidget.only(
      right: 10,
      left: 10,
      top: 10,
      child: GestureDetector(
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
                      builder: (context) => UpdateNewPage(
                        item: widget.item,
                      ),
                    );
                  },
                ),
              ]);
        },
        child: Card(
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          // color: news.color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          //elevation: 10,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    child: Image.network(
                      widget.item.image(),
                      fit: BoxFit.fill,
                      loadingBuilder: (context, child, loadingProgress) {
                        return (loadingProgress == null)
                            ? child
                            : const Center(child: CircularProgressIndicator());
                      },
                    ),
                    height: 250,
                  )),
                 /* Stack(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateNewPage(item: widget.item,)

                            ));},
                          icon: Icon(Icons.power_input_rounded)
                      ),
                    ],
                  )*/
                ],
              ),
              const Divider(),
              PaddedWidget.only(
                left: 10,
                right: 10,
                bottom: 10,
                top: 5,
                child: Column(
                  children: [
                    PaddedWidget.only(
                      bottom: widget.item.content != null ? 10 : 0,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(widget.item.title,
                                textAlign: TextAlign.left,
                                softWrap: true,
                                style: FontStyles.large.copyWith(
                                    color: ColorStyles.darkerGrey,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    if (widget.item.content != null)
                      Row(
                        children: [
                          Expanded(
                            child: Text(widget.item.content!,
                                style: FontStyles.medium
                                    .copyWith(color: ColorStyles.darkerGrey),
                                textAlign: TextAlign.justify,
                                maxLines: 2),
                          )
                        ],
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 20,
                                color: ColorStyles.darkGrey,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                widget.item.uploadDate,
                                style: const TextStyle(
                                  color: ColorStyles.darkGrey,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Visibility(
                                    visible: widget.item.hyperlink != null,
                                    child: IconButton(
                                        onPressed: () async {
                                          await launch(widget.item.hyperlink!);
                                        },
                                        icon: const Icon(
                                          Icons.share,
                                          color: ColorStyles.black,
                                          size: 20,
                                        ))),
                                if (widget.item.hyperlink != null &&
                                    widget.item.hasAttachment)
                                  const Spacer(),
                                Visibility(
                                    visible: widget.item.hasAttachment,
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PdfViewer(widget.item
                                                          .attachment()!)));
                                        },
                                        icon: const Icon(
                                          Icons.file_present,
                                          color: ColorStyles.black,
                                          size: 20,
                                        ))),
                                if (widget.item.hyperlink == null &&
                                    !widget.item.hasAttachment)
                                  const SizedBox(height: 50)
                              ]),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

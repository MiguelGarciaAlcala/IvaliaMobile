import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/new.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/styles/fonts.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/common/pdf_viewer.dart';
import 'package:url_launcher/url_launcher.dart';

class PublicNewItem extends StatelessWidget {
  final New item;
  const PublicNewItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddedWidget.only(
      right: 10, left: 10, top: 10,
      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        // color: news.color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        //elevation: 10,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                      child: Image.network(
                        item.image(),
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, loadingProgress) {
                          return (loadingProgress == null) ? child : const Center(child: CircularProgressIndicator());
                        },
                      ),
                      height: 250,
                    )
                )
              ],
            ),

            const Divider(),

            PaddedWidget.only(
              left: 10, right: 10, bottom: 10, top: 5,
              child: Column(
                children: [
                  PaddedWidget.only(
                    bottom: item.content != null ? 10 : 0,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                              item.title,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: FontStyles.large.copyWith(
                                color: ColorStyles.darkerGrey,
                                fontWeight: FontWeight.bold
                              )
                          ),
                        ),
                      ],
                    ),
                  ),

                  if(item.content != null) Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.content!,
                          style: FontStyles.medium.copyWith(color: ColorStyles.darkerGrey),
                          textAlign: TextAlign.justify,
                          maxLines: 2
                        ),
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
                              item.uploadDate,
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
                                  visible: item.hyperlink != null,
                                  child: IconButton(
                                      onPressed: () async {
                                        await launch(item.hyperlink!);
                                      },
                                      icon: const Icon(
                                        Icons.share,
                                        color: ColorStyles.black,
                                        size: 20,
                                      )
                                  )
                              ),

                              if(item.hyperlink != null && item.hasAttachment) const Spacer(),

                              Visibility(
                                  visible: item.hasAttachment,
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => PdfViewer(item.attachment()!)
                                        ));
                                      },
                                      icon: const Icon(
                                        Icons.file_present,
                                        color: ColorStyles.black,
                                        size: 20,
                                      )
                                  )
                              ),

                              if(item.hyperlink == null && !item.hasAttachment) const SizedBox(height: 50)
                            ]
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

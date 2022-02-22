import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/file_resource.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/items/public_file_item.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/items/public_link_item.dart';

class PublicFilesList extends StatelessWidget {
  final RefreshCallback onRefresh;
  final List<FileResource> items;

  const PublicFilesList({required this.items, required this.onRefresh, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: onRefresh,
        child: Column(
          children: [
            Expanded(
              child: PaddedWidget.only(
                top: 30, right: 20, left: 20,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PublicFileItem(items[index]);
                  },
                )
              )
            )
          ],
        )
    );
  }
}
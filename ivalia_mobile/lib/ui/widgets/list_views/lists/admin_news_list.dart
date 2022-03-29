import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/new.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/items/admin_new_item.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/items/public_new_item.dart';

class AdminNewsList extends StatelessWidget {
  final List<New> items;
  final RefreshCallback onRefresh;

  const AdminNewsList({required this.items, required this.onRefresh,  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        clipBehavior: Clip.antiAlias,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return PaddedWidget.only(
            bottom: index == items.length - 1 ? 20 : 0,
            child: AdminNewItem(items[index],index),
          );
        },
      ),
    );
  }
}

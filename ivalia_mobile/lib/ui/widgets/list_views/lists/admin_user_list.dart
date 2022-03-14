import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/logged_user.dart';
import 'package:ivalia_mobile/api/models/view/user.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/items/admin_user_item.dart';
import 'package:ivalia_mobile/ui/widgets/pages/myprofile_page.dart';

class AdminUserList extends StatefulWidget {
  final List<User> items;
  final RefreshCallback onRefresh;

  const AdminUserList({required this.items, required this.onRefresh, Key? key})
      : super(key: key);

  @override
  State<AdminUserList> createState() => _AdminUserListState();
}

class _AdminUserListState extends State<AdminUserList> {
  //const AdminUserList({Key? key}) : super(key: key);
  late List<User> newDataList = List.from(widget.items);

  onItemChanged(String value) {
    setState(() {
      newDataList = widget.items
          .where((string) =>
              string.Fullname.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: widget.onRefresh,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                //controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Buscar Usuairo...',
                ),
                onChanged: onItemChanged,
              ),
            ),
            Expanded(
              child: ListView(
                clipBehavior: Clip.antiAlias,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: newDataList.map((data) {
                  return AdminUserListItem(item: data);
                }).toList(),
                // itemCount: widget.items.length,
                //itemBuilder: (context, i) => AdminUserListItem(item: widget.items[i])
              ),
            )
          ],
        ));
  }
}

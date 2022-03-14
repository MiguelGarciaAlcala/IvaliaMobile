import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/widgets/charts/items/uploaded_files_item.dart';

class UploadedFilesList extends StatefulWidget {
  const UploadedFilesList({Key? key}) : super(key: key);

  @override
  State<UploadedFilesList> createState() => _UploadedFilesListState();
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}
List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return
      Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}




class _UploadedFilesListState extends State<UploadedFilesList> {
  final List<Item> _data = generateItems(8);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: UploadedFilesItem(_data),
      ),
    );
  }
}

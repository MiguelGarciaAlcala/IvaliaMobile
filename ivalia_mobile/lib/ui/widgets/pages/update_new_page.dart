

import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/new.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/lists/add_new_list.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/lists/update_new_list.dart';

class UpdateNewPage extends StatefulWidget {
  final New item;
  const UpdateNewPage({required this.item,  Key? key}) : super(key: key);

  @override
  _UpdateNewPageState createState() => _UpdateNewPageState();
}

class _UpdateNewPageState extends State<UpdateNewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar(
        title: 'Actualizar Noticia'
      ),
          body: UpdateNewList(item: widget.item,),

      floatingActionButton: FloatingActionButton(

        onPressed: () {
          Navigator.pop(context);
          //Navigator.push(
            //  context,
            //  MaterialPageRoute(
            //      builder: (context) => const AddNewPage()));
        },
        child: Icon(Icons.save),
        backgroundColor: ColorStyles.darkBlue,
      ),
    );

  }
}

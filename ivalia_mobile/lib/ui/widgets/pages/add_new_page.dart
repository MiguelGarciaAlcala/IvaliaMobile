

import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:ivalia_mobile/ui/widgets/list_views/lists/add_new_list.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({Key? key}) : super(key: key);

  @override
  _AddNewPageState createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar(
        title: 'Nueva Noticia'
      ),
          body: AddNewList(),
      floatingActionButton:
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
            //Navigator.push(
              //  context,
              //  MaterialPageRoute(
              //      builder: (context) => const AddNewPage()));
          },
          child: Icon(Icons.save,size: 30,),
          elevation: 10,
          backgroundColor: ColorStyles.darkBlue,
        ),
      ),
    );

  }
}

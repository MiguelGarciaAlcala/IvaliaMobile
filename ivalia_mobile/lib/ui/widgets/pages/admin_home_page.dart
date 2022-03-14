
import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:ivalia_mobile/ui/widgets/charts/lists/uploaded_files_list.dart';
import 'package:ivalia_mobile/ui/widgets/drawers/admin_drawer.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: PageBar(),
        drawer: AdminDrawer(),
        body: Container(
            child: Column(
          children:  [
            Text(
              'Estatus de carga de archivos',
              style: TextStyle(fontSize: 18),
            ),
            Expanded(child: UploadedFilesList()),
            Text(
              'Estadidistica 2',
              style: TextStyle(fontSize: 18),
            ),
            Divider(),
            /*Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, int) {
                  //SimpleBarChart;
                  return Card(
                    child: ListTile(
                        title: Text('Motivation $int'),
                        subtitle:
                            Text('this is a description of the motivation')),
                  );
                },
              ),
            ),*/
          ],
        )));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/charts/lists/uploaded_files_list.dart';

class UploadedFilesItem extends StatefulWidget {
  final List<Item> vdata;

  const UploadedFilesItem(this.vdata, {Key? key}) : super(key: key);

  @override
  _UploadedFilesItemState createState() => _UploadedFilesItemState();
}

class _UploadedFilesItemState extends State<UploadedFilesItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          widget.vdata[index].isExpanded = !isExpanded;
        });
      },
      children: widget.vdata.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          //backgroundColor: ColorStyles.lightGrey,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                if (item.headerValue == 'Panel 3') ...[
                  const Icon(Icons.fiber_manual_record_rounded,
                      color: Colors.green, size: 20),
                  const Icon(
                    Icons.fiber_manual_record_rounded,
                    color: Colors.red,
                    size: 20,
                  ),
                ] else ...[
                  const Icon(Icons.fiber_manual_record_rounded,
                      color: Colors.green, size: 20),
                  const Icon(Icons.fiber_manual_record_rounded,
                      color: Colors.green, size: 20),
                ]
              ]),
              // const Icon(Icons.warning),
              onTap: () {
                setState(() {
                  //MbuildPopupDialog(context);
                  widget.vdata
                    .removeWhere((Item currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  Widget MbuildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Popup example'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hello"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: Text('Close'),
        ),
      ],
    );
  }
}

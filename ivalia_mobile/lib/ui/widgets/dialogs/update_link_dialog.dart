import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/link_resource.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';

class UpdateLinkDialog extends StatefulWidget {
  final String title;
  final LinkResource item;

  const UpdateLinkDialog({Key? key, required this.title, required this.item})
      : super(key: key);

  @override
  State<UpdateLinkDialog> createState() => _UpdateLinkDialogState();
}

class _UpdateLinkDialogState extends State<UpdateLinkDialog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        insetPadding: const EdgeInsets.all(0.5),
        alignment: Alignment.center,
        title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            //padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Text(widget.title,
                style: const TextStyle(fontSize: 20,color: ColorStyles.darkBlue), textAlign: TextAlign.center)),
        children: [
         const Divider(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6,right: 6),
            child: TextField(
              controller: TextEditingController(text: widget.item.description),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
            ),
          ),
         const Divider( height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 6,right: 6),
            child: TextField(
              controller: TextEditingController(text: widget.item.hyperlink),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.link_outlined),
                border: OutlineInputBorder(),
                //labelText: widget.item.hyperlink,//'Hipevincul',
              ),
            ),
          ),
          Divider(height: 20,),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('Cancelar'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    //padding: const EdgeInsets.all(16.0),
                    primary: ColorStyles.darkBlue,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                ),
                const Divider(
                  height: 20.0,
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 5,left: 3),
                    //padding: const EdgeInsets.only(top: 2),
                    child: TextButton(
                      child: const Text('Aceptar'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        //padding: const EdgeInsets.all(16.0),
                        primary: ColorStyles.darkBlue,
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

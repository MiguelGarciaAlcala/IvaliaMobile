import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/text_fields/text_input_field.dart';

class AddDownloadDialog extends StatefulWidget {
  final String title;

  const AddDownloadDialog({Key? key, required this.title}) : super(key: key);

  @override
  State<AddDownloadDialog> createState() => _AddDownloadDialogState();
}

class _AddDownloadDialogState extends State<AddDownloadDialog> {
  late String v_image;
  late bool band_image;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      contentPadding: EdgeInsets.only(top: 18, left: 5, right: 5),
      insetPadding: EdgeInsets.all(6.0),
      alignment: Alignment.center,
      title: Text(
        'Nuevo Descargable',
        style: TextStyle(color: ColorStyles.darkBlue),
        textAlign: TextAlign.center,
      ),
      content: Container(
        width: 350,
        height: 200,
        child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          TextInputField(
            hint: 'Descripcion',
            prefixIcon: Icon(Icons.description),
          ),
          const Divider(
            height: 20,
          ),
          TextInputField(
            hint: 'Documento',
            prefixIcon: Icon(Icons.document_scanner),
            suffixIcon: IconButton(
              icon: Icon(Icons.folder),
              onPressed: () async{
                FilePickerResult? result =
                await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf', 'doc'],
                );

                if (result != null) {
                  PlatformFile file = result.files.first;
                  setState(() {
                    v_image = file.path!;
                    band_image = true;
                  });
                } else {
                  // User canceled the picker
                }
              },
            ),
          ),
          Divider(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
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
              Divider(
                height: 20,
              ),
              TextButton(
                child: const Text('Aceptar'),
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  //padding: const EdgeInsets.all(16.0),
                  primary: ColorStyles.darkBlue,
                  textStyle: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/new.dart';
import 'package:ivalia_mobile/tools/file_picker.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/text_fields/text_input_field.dart';

class UpdateNewItem extends StatefulWidget {
  final New item;

  const UpdateNewItem({required this.item, Key? key}) : super(key: key);

  @override
  _UpdateNewItemState createState() => _UpdateNewItemState();
}

class _UpdateNewItemState extends State<UpdateNewItem> {
  late String v_image;
  late bool band_image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(10),
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          child: Image.network(
                            widget.item.image(),
                            fit: BoxFit.fill,
                            loadingBuilder: (context, child, loadingProgress) {
                              return (loadingProgress == null)
                                  ? child
                                  : const Center(
                                      child: CircularProgressIndicator());
                            },
                          ),
                          height: 200,
                        )),
                      ],
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              onPressed: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['jpg'],
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
                              icon: const Icon(Icons.edit_rounded, size: 30)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Divider(),
              Container(
                width: 1000.0,
                child: TextInputField(
                  maxlines: 2,
                  controller: TextEditingController(text: widget.item.title),
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              const Divider(),
              TextInputField(
                maxlines: 5,
                controller: TextEditingController(text: widget.item.content),
                prefixIcon: Icon(
                  Icons.description_rounded,
                ),
                hint: 'Contenido',
              ),
             const Divider(),
              TextInputField(
                controller: TextEditingController(text: widget.item.hyperlink),
                prefixIcon: Icon(
                  Icons.link_outlined,
                ),
                hint: 'Enlace',
              ),
              const Divider(),
              TextInputField(
                controller: TextEditingController(text: widget.item.hasAttachment.toString()),
                hint: 'Archivo',
                prefixIcon: Icon(
                  Icons.document_scanner,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.folder),
                  onPressed: () async {
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
            ],
          )
        ],
      ),
    );
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/text_fields/text_input_field.dart';

class AddNewItem extends StatefulWidget {
  const AddNewItem({Key? key}) : super(key: key);

  @override
  _AddNewItemState createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  late String v_image;
  late bool band_image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            //width: 400,
            //height: 300,
            child: Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                            //item.image(),
                            'https://us.123rf.com/450wm/koblizeek/koblizeek1902/koblizeek190200055/125337077-ning%C3%BAn-s%C3%ADmbolo-de-vector-de-imagen-falta-el-icono-disponible-no-hay-galer%C3%ADa-para-este-momento-.jpg?ver=6',
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
                              onPressed: () async{
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
                  prefixIcon: Icon(Icons.title),
                  hint: 'Titulo De La Noticia',
                ),

                /* TextFormField(
                  maxLines: 2,
                  //initialValue: widget.item.Fullname,
                  //enabled: false,
                  decoration: const InputDecoration(
                    filled: true,
                    isDense: false,
                    focusColor: ColorStyles.darkBlue,
                    prefixIcon: Icon(Icons.title),
                    border: OutlineInputBorder(gapPadding: 5),
                    hintText: 'Titulo De La Noticia',
                  ),
                ),*/
              ),
              Divider(),
                 TextInputField(
                   maxlines: 5,
                   prefixIcon: Icon(
                     Icons.description_rounded,
                   ),
                   hint: 'Contenido',
                 ),
                 /*TextFormField(
                   textAlign: TextAlign.center,
                   maxLines: 5,
                  decoration: const InputDecoration(
                    filled: true,
                    prefixIcon: Icon(
                      Icons.content_copy,
                    ),
                    border: OutlineInputBorder(gapPadding: 1),
                    hintText: 'Contenido',
                  ),
                ),*/
              Divider(),
              TextInputField(
                prefixIcon: Icon(
                  Icons.link_outlined,
                ),
                hint: 'Enlace',
              ),
              /*TextFormField(
                //initialValue: widget.item.Fullname,
                //enabled: false,
                decoration: const InputDecoration(
                  filled: true,
                  focusColor: ColorStyles.darkBlue,
                  //contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  prefixIcon: Icon(
                    Icons.link_outlined,
                  ),
                  border: OutlineInputBorder(gapPadding: 1),
                  hintText: 'Enlace',
                ),
              ),*/
              Divider(),
              TextInputField(
              /*TextFormField(
                textAlign: TextAlign.justify,
                //initialValue: widget.item.Fullname,
                //enabled: false,
                decoration: InputDecoration(
                  hintText: 'Archivo',
                  filled: true,
                  focusColor: ColorStyles.darkBlue,
                  //contentPadding: const EdgeInsets.symmetric(vertical: 40.0),*/
                  hint: 'Documento',
                  prefixIcon: Icon(
                    Icons.document_scanner,
                  ),
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
            ],
          )
        ],
      ),
    );
  }
}

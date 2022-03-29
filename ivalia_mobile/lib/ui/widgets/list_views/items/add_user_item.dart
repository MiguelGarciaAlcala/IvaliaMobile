
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/text_fields/text_input_field.dart';

class AddUserItem extends StatefulWidget {
  const AddUserItem({Key? key}) : super(key: key);

  @override
  _AddUserItemState createState() => _AddUserItemState();
}

class _AddUserItemState extends State<AddUserItem> {
  late String v_image;
  late bool band_image = false;
  late bool _isVisible;
  late bool V_isVisibleSA = false;
  late bool V_isVisibleCA = false;
  late bool isChecked = true;
  late String dropdownValue = 'Selecciona Un Cliente';
  late String dropdownValueTU = 'Selecciona Un Tipo De Usuario';
  late String dropdownValueClient = 'Selecciona Super Admin Asociado';

  @override
  void initState() {
    super.initState();
    _isVisible = true;
    isChecked = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  /*void Mchanged(bool visibility, String field) {
    setState(() {
      if (field == "tag"){
        visibilityTag = visibility;
      }
      if (field == "obs"){
        visibilityObs = visibility;
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [ColorStyles.darkBlue, ColorStyles.darkBlue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.5, 0.9],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.white70,
                      maxRadius: 70,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        maxRadius: 60,
                        backgroundImage: band_image
                            // AssetImage(v_image) as ImageProvider
                            ? AssetImage(v_image) as ImageProvider
                            : NetworkImage(
                                'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
                        backgroundColor: ColorStyles.lightGrey,
                        child: Stack(children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              radius: 19,
                              backgroundColor: ColorStyles.white,
                              child: IconButton(
                                icon: Icon(Icons.camera_alt),
                                onPressed: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['png'],
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
                          ),
                        ]),
                        // backgroundImage: NetworkImage(widget.item.LogourlUser),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Column(
          children: [
            PaddedWidget.only(
              right: 10,
              left: 10,
              top: 30,
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      'Activo',
                      style: TextStyle(
                        color: ColorStyles.darkBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: this.isChecked, //isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    dense: true,
                    title: const Text(
                      'Tipo De Usuario',
                      style: TextStyle(
                        color: ColorStyles.darkBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          width: 600,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blueGrey,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(8)),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline:
                                DropdownButtonHideUnderline(child: Container()),
                            borderRadius: BorderRadius.circular(8),
                            value: dropdownValueTU,
                            dropdownColor: ColorStyles.lightGrey,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 50,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValueTU = newValue!;
                                if (newValue == 'Cliente') {
                                  //_isVisible = false;
                                  V_isVisibleSA = false;
                                  V_isVisibleCA = true;
                                } else if (newValue == 'Admin') {
                                  V_isVisibleCA = false;
                                  V_isVisibleSA = true;
                                } else {
                                  V_isVisibleCA = false;
                                  V_isVisibleSA = false;
                                }
                              });
                            },
                            items: <String>[
                              'Selecciona Un Tipo De Usuario',
                              'Super Admin',
                              'Admin',
                              'Cliente',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                                /*child: value == 'Admin'?
                                   Text(value):Text('data')*/
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: V_isVisibleSA,
                    child: ListTile(
                      dense: true,
                      title: const Text(
                        'Super Admin Asociado',
                        style: TextStyle(
                          color: ColorStyles.darkBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            width: 600,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.blueGrey,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(8)),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: DropdownButtonHideUnderline(
                                  child: Container()),
                              borderRadius: BorderRadius.circular(8),
                              value: dropdownValueClient,
                              dropdownColor: ColorStyles.lightGrey,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 50,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValueClient = newValue!;
                                });
                              },
                              items: <String>[
                                'Selecciona Super Admin Asociado',
                                'Super Admin 1',
                                'Super Admin 2',
                                'Super Admin 3',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  Visibility(
                    visible: V_isVisibleCA,
                    child: ListTile(
                      dense: true,
                      title: const Text(
                        'Cliente Asociado',
                        style: TextStyle(
                          color: ColorStyles.darkBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            width: 600,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.blueGrey,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(8)),
                            child: DropdownButton<String>(
                              underline: DropdownButtonHideUnderline(
                                  child: Container()),
                              borderRadius: BorderRadius.circular(8),
                              value: dropdownValue,
                              dropdownColor: ColorStyles.lightGrey,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 50,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'Selecciona Un Cliente',
                                'John Deere',
                                'Mahindra',
                                'Agua el Teco',
                                'Coca Cola'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Usuario',
                      style: TextStyle(
                        color: ColorStyles.darkBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: TextInputField(
                      hint: 'Ingresa el usuario',
                    ),
                  ),
                  const Divider(),
                  ListTile(
                      title: const Text(
                        'Nombre del usuario',
                        style: TextStyle(
                          color: ColorStyles.darkBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: TextInputField(
                        hint: 'Ingresa el nombre del usuario',
                      )),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      'Email',
                      style: TextStyle(
                        color: ColorStyles.darkBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: TextInputField(
                      hint: 'Ingres el correo del usuario',
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      'Contraseña',
                      style: TextStyle(
                        color: ColorStyles.darkBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: TextInputField(
                        // initialValue: widget.item.Password,
                        //enabled: _isEnabled,
                        //controller: passwordController,
                        //errorText: _validPassword ? null : 'Contraseña requerida',
                        obscureText: _isVisible,
                        hint: 'Ingresa la contraseña del usuario',
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            child: Icon(
                                _isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: ColorStyles.darkGrey))),
                  ),
                  Divider(),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          onPressed: () {
                            // Add your onPressed code here!
                          },
                          backgroundColor: ColorStyles.darkBlue,
                          child: const Icon(Icons.save),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/user.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/text_fields/text_input_field.dart';

class DetailUserListItem extends StatefulWidget {
  final User item;

  const DetailUserListItem({required this.item, Key? key}) : super(key: key);

  @override
  _DetailUserListItemState createState() => _DetailUserListItemState();
}

class _DetailUserListItemState extends State<DetailUserListItem> {
  late TextEditingController MyusernameController;
  late TextEditingController MypasswordController;
  late bool _isVisible;
  late bool isChecked;

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
                        backgroundImage: NetworkImage(widget.item.LogourlUser),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.item.Fullname,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              //user name
              Text(
                widget.item.Username,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
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
                          focusColor: ColorStyles.darkBlue,
                          value: isChecked,
                          onChanged: (bool? value) {
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
                    title: const Text(
                      'Tipo de Usuario',
                      style: TextStyle(
                        color: ColorStyles.darkBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: TextInputField(
                      controller: TextEditingController(text: widget.item.Roleid.toString()),
                      hint: 'Ingres el nombre del usuario',
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      'Usuario',
                      style: TextStyle(
                        color: ColorStyles.darkBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: TextInputField(
                      controller: TextEditingController(text: widget.item.Username),
                      hint: 'Ingresa el usuario',
                    ),
                  ),
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
                      controller: TextEditingController(text: widget.item.Fullname),
                      hint: 'Ingres el nombre del usuario',
                    ),
                  ),
                  Divider(),
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
                      controller: TextEditingController(text: widget.item.Email),
                     hint: 'Ingresa el correo del usuario',
                    ),
                  ),
                  Divider(),
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
                      controller: TextEditingController(text: widget.item.Password),
                      obscureText: _isVisible,
                          hint: 'Ingres la contraseña del usuario',
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
                                  color: ColorStyles.darkGrey))

                    ),
                  ),
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
            ), // padded
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
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
    return Scaffold(
      appBar: PageBar(
        title: "Agregar usuario",
      ),
      body: ListView(children: [
        Column(
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
                            backgroundColor: ColorStyles.lightGrey,
                            child: Stack(children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 19,
                                  backgroundColor: ColorStyles.white,
                                  child: IconButton(
                                    icon: Icon(Icons.camera_alt),
                                    onPressed: () {},
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Checkbox(
                              value: true, //isChecked,
                              onChanged: (bool? value) {
                                //setState(() {
                                //isChecked = value!;
                                //});
                              },
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text(
                          'Nombre completo de usuario',
                          style: TextStyle(
                            color: ColorStyles.darkBlue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: TextFormField(
                          //initialValue: widget.item.Fullname,
                          //enabled: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Ingresa el nombre de cpmpleto',
                          ),
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
                        subtitle: TextFormField(
                          // initialValue: widget.item.Email,
                          //enabled: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Ingresa tu correo',
                          ),
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
                        subtitle: TextFormField(
                          // initialValue: widget.item.Password,
                          //enabled: _isEnabled,
                          //controller: passwordController,
                          //errorText: _validPassword ? null : 'Contraseña requerida',
                          obscureText: _isVisible,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Ingresa tu contraseña',
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
                      ),
                      ListTile(
                        title: const Text(
                          'Nombre de usuario',
                          style: TextStyle(
                            color: ColorStyles.darkBlue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: TextFormField(
                          // initialValue: widget.item.Username,
                          //enabled: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Ingresa tu correo',
                          ),
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
        ),
      ]),
    );
  }
}

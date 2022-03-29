import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ivalia_mobile/api/models/view/logged_user.dart';
import 'package:ivalia_mobile/api/models/view/logged_user_act.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/text_fields/text_input_field.dart';

class MyProfileItem extends StatefulWidget {
  final LoggedUserAct items;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const MyProfileItem(
      {required this.items,
      required this.passwordController,
      required this.usernameController,
      Key? key})
      : super(key: key);

  @override
  State<MyProfileItem> createState() => _MyProfileItemState();
}

class _MyProfileItemState extends State<MyProfileItem> {
  late bool isVisible;

  @override
  void initState() {
    super.initState();
    isVisible = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late bool _validUsername;
    late bool _validPassword;
    late bool _isVisible = true;
    late bool _isEnabled = false;

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
                children: <Widget>[
                  CircleAvatar(
                      backgroundColor: Colors.white70,
                      maxRadius: 70,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        maxRadius: 60,
                        backgroundImage: NetworkImage(widget.items.LogourlUser),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.items.fullname,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              //user name
              Text(
                widget.items.role,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              PaddedWidget.only(
                right: 10,
                left: 10,
                top: 30,
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Tipo de usuario',
                        style: TextStyle(
                          color: ColorStyles.darkBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //contentPadding:  EdgeInsets.all(10.0),
                      subtitle:
                      TextInputField(
                        enable: false,
                        controller: TextEditingController()..text = widget.items.role,
                      ),
                      /*TextFormField(
                        enabled: false,
                        initialValue: widget.items.role,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Ingresa el tipo de usuario',
                        ),
                      ),*/
                    ),
                    const Divider(height: 20,),
                    ListTile(
                      title: const Text(
                        'Nombre de usuario',
                        style: TextStyle(
                          color: ColorStyles.darkBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: TextInputField(
                        controller: TextEditingController()..text = widget.items.fullname,
                      ),
                      /*subtitle: TextFormField(
                        //enabled: false,
                        initialValue: widget.items.fullname,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Ingresa el nombre del usuario',
                        ),
                      ),*/
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
                        controller: widget.usernameController,
                      ),
                      /*ubtitle: TextField(
                        //enabled: false,
                        controller: widget.usernameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Ingresa tu correo',
                        ),
                      ),*/
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
                      /*subtitle: TextInputField(
                        obscureText: _isVisible,
                        controller: widget.passwordController,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: Icon(
                            _isVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                              color: ColorStyles.darkGrey
                          ),
                        ),
                      ),*/
                      subtitle: TextField(
                        autofocus: false,
                        //enabled: _isEnabled,
                        controller: widget.passwordController,
                        //errorText: _validPassword ? null : 'Contraseña requerida',
                        obscureText: isVisible,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: ColorStyles.lightGrey)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: ColorStyles.lightGrey)
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Ingresa tu contraseña',
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                child: Icon(
                                    isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: ColorStyles.darkGrey))),
                      ),
                    ),
                    //const Divider(),
                    //const SizedBox(
                      //height: 10,
                    //),
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
              )
            ],
          ),
        )
      ],
    );
  }
}

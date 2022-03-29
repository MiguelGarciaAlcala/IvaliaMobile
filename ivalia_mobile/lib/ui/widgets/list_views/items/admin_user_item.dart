import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/models/view/logged_user.dart';
import 'package:ivalia_mobile/api/models/view/user.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:ivalia_mobile/ui/widgets/dialogs/message_confirm_dialog.dart';
import 'package:ivalia_mobile/ui/widgets/dialogs/message_dialog.dart';
import 'package:ivalia_mobile/ui/widgets/pages/detail_user_page.dart';

class AdminUserListItem extends StatelessWidget {
  final User item;

  //AdminUserListItem({required this.item})
  AdminUserListItem({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(5),
      child: ListTile(
        title: Text(item.Fullname),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(item.Email), Text('prueba')],
        ),
        leading: CircleAvatar(
          maxRadius: 30,
          minRadius: 20,
          child: Image.network(item.LogourlUser),
        ),
        trailing: IconButton(
            onPressed: () {
             /* showDialog(

                context: context,
                builder: (context) => MessageConfirmDialog(
                  title: "¿Estas seguro de borrar este regristro?",
                  content: 'Se borrara el registro',
                  actions: [
                    TextButton(
                      child: const Text(
                        'Cancelar',
                        softWrap: true,
                        style: TextStyle(
                            color: ColorStyles.darkBlue
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: const Text(
                        'Aceptar',
                        softWrap: true,
                        style: TextStyle(
                            color: ColorStyles.darkBlue
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    )

                  ],
                )
              );*/
            },
            icon: Icon(Icons.arrow_forward)),
        onTap: () {
          //Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailUserPage(items: item)));
        },
        //Icon(Icons.arrow_forward),
      ),
    );
  }
}

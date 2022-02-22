import 'package:ivalia_mobile/api/models/abstractions/serializable.dart';
import 'dart:convert' as convert;

class UserLoginRequest extends Serializable {
  final String username;
  final String hashedPassword;

  UserLoginRequest({required this.username, required this.hashedPassword});

  @override
  String serialize() {
    return convert.jsonEncode({
      'username': username,
      'hashedPassword': hashedPassword
    });
  }
}
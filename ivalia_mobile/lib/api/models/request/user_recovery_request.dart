import 'package:ivalia_mobile/api/models/abstractions/serializable.dart';
import 'dart:convert' as convert;

class UserRecoveryRequest extends Serializable {
  final String username;
  final String email;

  UserRecoveryRequest({required this.username, required this.email});

  @override
  String serialize() {
    return convert.jsonEncode({
      'username': username,
      'email': email
    });
  }
}
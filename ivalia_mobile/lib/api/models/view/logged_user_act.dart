import 'package:flutter/cupertino.dart';
import 'package:ivalia_mobile/api/models/view/media_link.dart';

class LoggedUserAct {
  final int id;
  final String role;
  final String token;
  final String pass;
  final String fullname;
  final String LogourlUser;

  //final Map<String, MediaLink> links;

  LoggedUserAct({
    required this.id,
    required this.role,
    required this.fullname,
    required this.pass,
    required this.token,
    required this.LogourlUser,
    //required this.links
  });

  factory LoggedUserAct.fromJson(Map<String, dynamic> json) {
    return LoggedUserAct(
      id: json['id'] as int,
      role: json['role'] as String,
      token: json['token'] as String,
      pass: json['pass'] as String,
      fullname:  json['fullname'] as String,
      LogourlUser:   json['LogourlUser'] as String,
      //links: MediaLink.getLinks(json['links'])
    );
  }
}

class RoleType {
  static const admin = 'A';
  static const client = 'C';
}
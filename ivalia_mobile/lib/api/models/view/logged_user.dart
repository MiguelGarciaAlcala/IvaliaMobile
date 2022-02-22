import 'package:ivalia_mobile/api/models/view/media_link.dart';

class LoggedUser {
  final int id;
  final String role;
  final String fullname;
  final String token;
  final Map<String, MediaLink> links;

  LoggedUser({
    required this.id,
    required this.role,
    required this.fullname,
    required this.token,
    required this.links
  });

  factory LoggedUser.fromJson(Map<String, dynamic> json) {
    return LoggedUser(
      id: json['id'] as int,
      role: json['role'] as String,
      fullname: json['fullname'] as String,
      token: json['token'] as String,
      links: MediaLink.getLinks(json['links'])
    );
  }
}

class RoleType {
  static const admin = 'A';
  static const client = 'C';
}
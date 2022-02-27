class LoggedUser {
  final int id;
  final String role;
  final String token;

  LoggedUser({
    required this.id,
    required this.role,
    required this.token
  });

  factory LoggedUser.fromJson(Map<String, dynamic> json) {
    return LoggedUser(
      id: json['id'] as int,
      role: json['role'] as String,
      token: json['token'] as String
    );
  }
}

class RoleType {
  static const admin = 'A';
  static const client = 'C';
}
class User {
  final int Roleid;
  final String Fullname;
  final String Username;
  final String Password;
  final String Email;
  final String ProfilePicture;
  final String Status;
  final String LogourlUser;

  User({required this.Roleid, required this.Fullname, required this.Username,required this.Password,
    required this.Email,required this.ProfilePicture,required this.Status,required this.LogourlUser});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        Roleid: json['Roleid'] as int,
        Fullname: json ['Fullname'] as String,
        Username: json['Username'] as String,
        Password: json['Password'] as String,
        Email:    json['Email'] as String,
        ProfilePicture: json['ProfilePicture'] as String,
        Status:   json['Status'] as String,
      LogourlUser:    json['LogourlUser'] as String,

    );
  }
}
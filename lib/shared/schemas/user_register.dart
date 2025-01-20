import 'dart:convert';

UserRegister userRegisterFromJson(String str) =>
    UserRegister.fromJson(json.decode(str));

String userRegisterToJson(UserRegister data) => json.encode(data.toJson());

class UserRegister {
  String username;
  String fullname;
  String password;

  UserRegister({
    required this.username,
    required this.fullname,
    required this.password,
  });

  factory UserRegister.fromJson(Map<String, dynamic> json) => UserRegister(
        username: json["username"],
        fullname: json["fullname"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "fullname": fullname,
        "password": password,
      };
}

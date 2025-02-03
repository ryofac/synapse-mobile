import 'dart:convert';

import 'package:synapse/clasroom/models/classroom_model.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String username;
  String fullname;
  String role;
  int id;
  List<ClassroomModel> classesJoined;

  UserModel({
    required this.username,
    required this.fullname,
    required this.role,
    required this.id,
    required this.classesJoined,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        fullname: json["fullname"],
        role: json["role"],
        id: json["id"],
        classesJoined: List<ClassroomModel>.from(
            json["classes_joined"].map((x) => ClassroomModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "fullname": fullname,
        "role": role,
        "id": id,
        "classes_joined":
            List<dynamic>.from(classesJoined.map((x) => x.toJson())),
      };
}

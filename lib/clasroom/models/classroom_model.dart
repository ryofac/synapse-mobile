import 'dart:convert';

ClassroomModel classroomModelFromJson(String str) =>
    ClassroomModel.fromJson(json.decode(str));

String classroomModelToJson(ClassroomModel data) => json.encode(data.toJson());

class ClassroomModel {
  int id;
  String className;
  String? photoUrl;
  int teacherId;

  ClassroomModel({
    required this.id,
    required this.className,
    this.photoUrl,
    required this.teacherId,
  });

  factory ClassroomModel.fromJson(Map<String, dynamic> json) => ClassroomModel(
        id: json["id"],
        className: json["className"],
        photoUrl: json["photoUrl"],
        teacherId: json["teacher_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "className": className,
        "photoUrl": photoUrl,
        "teacher_id": teacherId,
      };
}

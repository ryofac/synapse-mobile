import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:synapse/clasroom/models/classroom_model.dart';
import 'package:synapse/login/token_manager.dart';
import 'package:synapse/shared/repositories/base_api_repository.dart';

class ClassroomRepository extends BaseApiRepository {
  Future<List<ClassroomModel>> getAllClassrooms() async {
    String allClassroomsUrl = "/classroom/";

    String authToken = await TokenManager.instance.getAccessToken();

    var response = await client.get(allClassroomsUrl,
        options: Options(headers: {"Authorization": "Bearer $authToken"}));

    if (response.statusCode != 200) {
      debugPrint("Erro ao processar todas as classroomns");
      return List.empty();
    }

    List<dynamic> listJson = List.from(response.data);
    return listJson
        .map((classroomJson) => ClassroomModel.fromJson(classroomJson))
        .toList();
  }
}

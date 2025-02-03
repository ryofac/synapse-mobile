import 'package:dio/dio.dart';
import 'package:synapse/login/models/credentials.dart';
import 'package:synapse/shared/schemas/user_login.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:synapse/shared/schemas/user_register.dart';

class ApiClient {
  final BaseOptions clientOptions = BaseOptions(
    baseUrl: dotenv.env["API_BASE_URL"] ?? "http://localhost:3000/",
    connectTimeout: Duration(
        seconds:
            int.parse(dotenv.env["API_CONNECTION_TIMEOUT_SECONDS"] ?? "60")),
  );

  late Dio client;

  ApiClient() {
    client = Dio(clientOptions);
  }

  Future<Response> login(UserLogin userLogin) async {
    try {
      String loginUrl = "/auth/login/";
      Map<String, dynamic> payload = userLogin.toJson();

      Response response = await client.post(loginUrl, data: payload);

      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response!;
      }
      rethrow; // Relança a exceção caso não haja uma resposta.
    }
  }

  Future<Response> register(UserRegister userRegister) async {
    try {
      String loginUrl = "/auth/register/";
      Map<String, dynamic> payload = userRegister.toJson();

      Response response = await client.post(loginUrl, data: payload);

      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response!;
      }
      rethrow; // Relança a exceção caso não haja uma resposta.
    }
  }

  Future<Credentials?> refreshToken(String refreshToken) async {
    try {
      String refreshUrl = "/auth/refresh";
      Response response =
          await client.post(refreshUrl, data: {"refresh_token": refreshToken});

      if (response.statusCode != 200) {
        return null;
      }
      var json = response.data;
      return credentialsFromJson(json.toString());
    } on DioException {
      return null;
    }
  }
}

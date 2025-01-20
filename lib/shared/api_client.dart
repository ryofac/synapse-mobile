import 'package:dio/dio.dart';
import 'package:synapse/shared/schemas/user_login.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  final BaseOptions clientOptions = BaseOptions(
    baseUrl: dotenv.env["API_BASE_URL"] ?? "http://localhost:3000/",
    connectTimeout: Duration(
        seconds:
            int.parse(dotenv.env["API_CONNECTION_TIMEOUT_SECONDS"] ?? "60")),
  );

  late Dio client;

  ApiClient() {
    print(clientOptions.baseUrl);
    client = Dio(clientOptions);
  }

  Future<Response> login(UserLogin userLogin) async {
    try {
      String loginUrl = "/auth/login/";
      Map<String, dynamic> payload = userLogin.toJson();

      Response response = await client.post(loginUrl, data: payload);

      print(response);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response!;
      }
      rethrow; // Relança a exceção caso não haja uma resposta.
    }
  }
}

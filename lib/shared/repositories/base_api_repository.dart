import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseApiRepository {
  // Fornece o básico pra realizar o acesso à api via client
  final BaseOptions clientOptions = BaseOptions(
    baseUrl: dotenv.env["API_BASE_URL"] ?? "http://localhost:3000/",
    connectTimeout: Duration(
        seconds:
            int.parse(dotenv.env["API_CONNECTION_TIMEOUT_SECONDS"] ?? "60")),
  );

  late Dio client;

  BaseApiRepository() {
    client = Dio(clientOptions);
  }
}

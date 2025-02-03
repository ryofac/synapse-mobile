import 'package:dio/dio.dart';
import 'package:synapse/login/models/user_model.dart';
import 'package:synapse/login/token_manager.dart';
import 'package:synapse/shared/repositories/base_api_repository.dart';

class UserRepository extends BaseApiRepository {
  Future<UserModel> getLoggerUser() async {
    String userDetailsUrl = "/users/me/";

    String accessToken = await TokenManager.instance.getAccessToken();
    var headers = {"Authorization": "Bearer $accessToken"};

    Response response = await super
        .client
        .get(userDetailsUrl, options: Options(headers: headers));
    return UserModel.fromJson(response.data);
  }
}

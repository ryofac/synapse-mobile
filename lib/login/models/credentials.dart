import 'dart:convert';

Credentials credentialsFromJson(String str) =>
    Credentials.fromJson(json.decode(str));

String credentialsToJson(Credentials data) => json.encode(data.toJson());

class Credentials {
  String authToken;
  String refreshToken;

  Credentials({
    required this.authToken,
    required this.refreshToken,
  });

  factory Credentials.fromJson(Map<String, dynamic> json) => Credentials(
        authToken: json["auth_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "auth_token": authToken,
        "refresh_token": refreshToken,
      };
}

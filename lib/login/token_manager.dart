import 'dart:async';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:synapse/login/exceptions/login_expired.dart';
import 'package:synapse/login/models/credentials.dart';
import 'package:synapse/shared/api_client.dart';

class TokenManager {
  static TokenManager? _instance;

  static TokenManager get instance {
    _instance ??= TokenManager._();
    return _instance!;
  }

  String accessToken = "";
  String refreshToken = "";

  bool isRefreshing = false;
  Completer<void>? completer;

  ApiClient apiClient = ApiClient();

  FlutterSecureStorage storage = const FlutterSecureStorage(
    aOptions: AndroidOptions.defaultOptions,
  );

  TokenManager._();

  Future<String> getAccessToken() async {
    if (isTokenExpired() && !isRefreshing) {
      debugPrint("Token has expired, refreshing access token.");
      isRefreshing = true;
      completer = Completer<void>();
      await renewAccessToken();
      isRefreshing = false;
      completer?.complete();
    }
    if (isRefreshing) {
      debugPrint(
          "Already refreshing access token, waiting for it to complete.");
      await completer?.future;
    }
    return accessToken;
  }

  bool isTokenExpired() {
    try {
      JWT.decode(accessToken);
      return false;
    } on JWTExpiredException {
      return true;
    }
  }

  Future<void> renewAccessToken() async {
    final Credentials? token = await apiClient.refreshToken(refreshToken);
    if (token == null) {
      throw LoginExpired();
    }
    setToken(token);
  }

  void setToken(Credentials token) {
    accessToken = token.authToken;
    refreshToken = token.refreshToken;
  }
}

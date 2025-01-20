import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:synapse/login/ui/login_ui.dart';
import 'package:synapse/shared/api_client.dart';
import 'package:synapse/shared/schemas/user_login.dart';

class LoginContainer extends StatefulWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginContainer({super.key});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final ApiClient apiClient = ApiClient();

  void tryLoginUser() async {
    String username = widget.emailController.text;
    String password = widget.passwordController.text;
    UserLogin userLogin = UserLogin(username: username, password: password);

    print(userLogin.toJson());

    Response<dynamic> response = await apiClient.login(userLogin);

    bool success = response.statusCode == 200;

    if (mounted) {
      if (success) {
        // Exibe feedback positivo ou navega para outra tela
        Navigator.pushNamed(context, '/classes');
      } else {
        // Exibe mensagem de erro
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoginUi(
      passwordInputController: widget.passwordController,
      emailInputController: widget.emailController,
      onLoginPressed: tryLoginUser,
    );
  }
}

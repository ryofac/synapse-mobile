import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:synapse/login/ui/login_ui.dart';
import 'package:synapse/shared/api_client.dart';
import 'package:synapse/shared/schemas/login_response.dart';
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
  bool isLoading = false;

  void tryLoginUser() async {
    String username = widget.emailController.text;
    String password = widget.passwordController.text;
    UserLogin userLogin = UserLogin(username: username, password: password);

    try {
      setState(() {
        isLoading = true;
      });
      Response<dynamic> response = await apiClient.login(userLogin);

      if (mounted) {
        if (response.statusCode == 200) {
          LoginResponse body = LoginResponse(
              authToken: response.data["auth_token"],
              refreshToken: response.data["refresh_token"]);

          final jwtPayload = JWT.decode(body.authToken).payload;
          String fullNameFromToken = jwtPayload['fullName'] ?? 'Usuário';

          print(jwtPayload);
          // Exibe feedback positivo ou navega para outra tela
          Navigator.pushNamed(context, '/classes');
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Bem vindo $fullNameFromToken!")));
        } else if (response.statusCode == 401 || response.statusCode == 400) {
          // Exibe mensagem de erro
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Credenciais Inválidas!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Erro ao logar, tente novamente mais tarde!')),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Erro ao logar, tente novamente mais tarde!')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(isLoading);

    return LoginUi(
      passwordInputController: widget.passwordController,
      usernameInputController: widget.emailController,
      loginHandler: tryLoginUser,
      isLoading: isLoading,
    );
  }
}

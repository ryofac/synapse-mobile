import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:synapse/login/ui/register_ui.dart';
import 'package:synapse/shared/api_client.dart';
import 'package:synapse/shared/schemas/user_register.dart';

class RegisterContainer extends StatefulWidget {
  const RegisterContainer({super.key});

  @override
  State<RegisterContainer> createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
  final nameInputController = TextEditingController();
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();
  final usernameInputController = TextEditingController();
  final passwordRepeatController = TextEditingController();
  bool? isTeacher = false;

  ApiClient client = ApiClient();

  void handleIsTeacher(bool? value) {
    setState(() {
      isTeacher = value;
    });
  }

  bool passwordsMatch() {
    return passwordInputController.text == passwordRepeatController.text;
  }

  void handleRegister() async {
    UserRegister userRegister = UserRegister(
      username: usernameInputController.text,
      fullname: nameInputController.text,
      password: passwordInputController.text,
    );

    if (!passwordsMatch()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Senhas devem conhicidir!')),
      );
    }

    try {
      Response<dynamic> response = await client.register(userRegister);
      if (!mounted) return;
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cadastro realizado com sucesso!')),
        );
        Navigator.pop(context);
      } else if (response.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Erro de validação, cheque novamente seus campos')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Cadastro falhou, tente novamente mais tarde')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Cadastro falhou, tente novamente mais tarde')),
      );
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RegisterUi(
      usernameInputController: usernameInputController,
      passwordInputController: passwordInputController,
      nameInputController: nameInputController,
      emailInputController: emailInputController,
      passwordConfirmInputController: passwordRepeatController,
      handleIsTeacher: handleIsTeacher,
      isTeacher: isTeacher,
      registerHandler: handleRegister,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:synapse/login/components/app_main_header.dart';
import 'package:synapse/login/components/base_form.dart';
import 'package:synapse/login/components/email_field.dart';
import 'package:synapse/login/components/password_field.dart';
import 'package:synapse/shared/validators.dart';

class LoginUi extends StatelessWidget {
  final TextEditingController usernameInputController;
  final TextEditingController passwordInputController;

  final bool isLoading;

  final void Function() loginHandler;

  LoginUi({
    super.key,
    required this.usernameInputController,
    required this.passwordInputController,
    required this.isLoading,
    required this.loginHandler,
  });

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 100),
                child: AppMainHeader(
                    title: "Synapse",
                    description:
                        "Seu aplicativo de gerenciamento de turmas e fóruns"),
              ),
              Stack(
                children: [
                  BaseForm(
                    formKey: _formKey,
                    submitHandler: loginHandler,
                    formTitle: "Faça Login",
                    buttonChild: const Text("Entrar"),
                    fields: [
                      UsernameField(
                        usernameInputController: usernameInputController,
                        usernameValidator: usernameValidator,
                      ),
                      PasswordField(
                        passwordInputController: passwordInputController,
                        passwordValidator: passwordValidator,
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Não está cadastrado?"),
                  TextButton(
                    style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.all(8.0)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text("Cadastre-se"),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:synapse/login/components/email_field.dart';
import 'package:synapse/login/components/password_field.dart';

class LoginUi extends StatefulWidget {
  final TextEditingController emailInputController;
  final TextEditingController passwordInputController;
  final void Function() onLoginPressed;

  const LoginUi({
    super.key,
    required this.emailInputController,
    required this.passwordInputController,
    required this.onLoginPressed,
  });

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Text(
                    "Synapse",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const SizedBox(height: 16),
                const SizedBox(
                  width: 300,
                  child: Text(
                    "Seu aplicativo de gerenciamento de turmas",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
                margin:
                    const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).hintColor.withOpacity(0.2),
                        offset: const Offset(0, 10),
                        blurRadius: 20,
                      )
                    ]),
                child: Form(
                  key: globalFormKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 35,
                        child: Text(
                          "Faça Login",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(height: 20),
                      EmailField(
                          emailInputController: widget.emailInputController),
                      PasswordField(
                        passwordInputController: widget.passwordInputController,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.all(8.0),
                          ),
                        ),
                        onPressed: widget.onLoginPressed,
                        child: const Center(child: Text("Entrar")),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}

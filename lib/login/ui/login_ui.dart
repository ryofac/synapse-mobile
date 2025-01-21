import 'package:flutter/material.dart';
import 'package:synapse/login/components/email_field.dart';
import 'package:synapse/login/components/password_field.dart';
import 'package:synapse/shared/components/loading.dart';

class LoginUi extends StatelessWidget {
  final TextEditingController usernameInputController;
  final TextEditingController passwordInputController;

  final String? Function(String?)? usernameValidator;
  final String? Function(String?)? passwordValidator;

  final bool isLoading;

  final void Function() loginHandler;

  LoginUi({
    super.key,
    required this.usernameInputController,
    required this.passwordInputController,
    required this.loginHandler,
    this.usernameValidator,
    this.passwordValidator,
    required this.isLoading,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 120),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: Text(
                        "Synapse",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: 342,
                      child: Text(
                        "Seu aplicativo de fóruns e gerenciamento de turmas",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
              isLoading
                  ? const Loading()
                  : Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 26, horizontal: 20),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).colorScheme.primary,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .hintColor
                                      .withOpacity(0.2),
                                  offset: const Offset(0, 10),
                                  blurRadius: 20,
                                )
                              ]),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 35,
                                  child: Text(
                                    "Faça Login",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                UsernameField(
                                  usernameInputController:
                                      usernameInputController,
                                  usernameValidator: usernameValidator,
                                ),
                                PasswordField(
                                  passwordInputController:
                                      passwordInputController,
                                  passwordValidator: passwordValidator,
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    padding: WidgetStateProperty.all(
                                      const EdgeInsets.all(8.0),
                                    ),
                                    minimumSize: WidgetStateProperty.all(
                                      const Size(double.infinity, 10),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      loginHandler();
                                    }
                                  },
                                  child: Text("Entrar",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge),
                                ),
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

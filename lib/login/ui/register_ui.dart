import 'package:flutter/material.dart';
import 'package:synapse/login/components/base_form.dart';
import 'package:synapse/login/components/base_input.dart';
import 'package:synapse/login/components/email_field.dart';
import 'package:synapse/shared/validators.dart';

class RegisterUi extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController nameInputController;
  final TextEditingController emailInputController;
  final TextEditingController passwordInputController;
  final TextEditingController passwordConfirmInputController;
  final TextEditingController usernameInputController;

  final bool? isTeacher;
  final ValueChanged<bool?>? handleIsTeacher;

  final void Function() registerHandler;

  RegisterUi({
    super.key,
    required this.nameInputController,
    required this.emailInputController,
    required this.passwordInputController,
    required this.usernameInputController,
    required this.passwordConfirmInputController,
    required this.isTeacher,
    required this.handleIsTeacher,
    required this.registerHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 160),
              child: BaseForm(
                formKey: _formKey,
                formTitle: "Cadastre-se",
                submitHandler: registerHandler,
                fields: [
                  BaseInputField(
                    inputController: nameInputController,
                    keyboardType: TextInputType.name,
                    inputValidator: nameValidator,
                    hintText: "Nome Completo",
                  ),
                  BaseInputField(
                    inputController: emailInputController,
                    keyboardType: TextInputType.emailAddress,
                    inputValidator: emailValidator,
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  UsernameField(
                    usernameInputController: usernameInputController,
                    usernameValidator: usernameValidator,
                  ),
                  BaseInputField(
                    inputController: passwordInputController,
                    keyboardType: TextInputType.text,
                    inputValidator: passwordValidator,
                    hintText: "Senha",
                    obscureText: true,
                    prefixIcon: Icon(Icons.lock,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  BaseInputField(
                    inputController: passwordConfirmInputController,
                    keyboardType: TextInputType.text,
                    inputValidator: passwordValidator,
                    hintText: "Repita sua senha",
                    prefixIcon: Icon(Icons.lock,
                        color: Theme.of(context).colorScheme.onPrimary),
                    obscureText: true,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Você é professor?"),
                        Checkbox(
                          value: isTeacher,
                          onChanged: handleIsTeacher,
                        )
                      ],
                    ),
                  )
                ],
                buttonChild: const Text("Cadastre-se"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

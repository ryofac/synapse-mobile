import 'package:flutter/material.dart';
import 'package:synapse/login/components/base_input.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController usernameInputController;
  final String? Function(String?)? usernameValidator;
  final String? hintText;

  const UsernameField({
    super.key,
    required this.usernameInputController,
    required this.usernameValidator,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return BaseInputField(
      inputController: usernameInputController,
      inputValidator: usernameValidator,
      keyboardType: TextInputType.emailAddress,
      hintText: hintText ?? "Nome de Usuário",
      prefixIcon:
          Icon(Icons.person, color: Theme.of(context).colorScheme.onPrimary),
    );
  }
}

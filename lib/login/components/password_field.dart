import 'package:flutter/material.dart';
import 'package:synapse/login/components/base_input.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordInputController;
  final String? Function(String?)? passwordValidator;
  final String? hintText;

  const PasswordField({
    super.key,
    required this.passwordInputController,
    this.passwordValidator,
    this.hintText,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return BaseInputField(
      obscureText: hidePassword,
      inputController: widget.passwordInputController,
      inputValidator: widget.passwordValidator,
      keyboardType: TextInputType.text,
      hintText: widget.hintText ?? "Senha",
      prefixIcon:
          Icon(Icons.lock, color: Theme.of(context).colorScheme.onPrimary),
      suffixIcon: IconButton(
        color: Theme.of(context).colorScheme.onPrimary,
        onPressed: () {
          setState(() {
            hidePassword = !hidePassword;
          });
        },
        icon: hidePassword
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
      ),
    );
  }
}

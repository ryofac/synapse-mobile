import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordInputController;

  const PasswordField({
    super.key,
    required this.passwordInputController,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool hidePassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: hidePassword,
      validator: (input) => input != null && !input.contains("@")
          ? "Endereço de email inválido"
          : null,
      decoration: InputDecoration(
        hintText: "Senha",
        prefixIcon:
            Icon(Icons.lock, color: Theme.of(context).colorScheme.onPrimary),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.onPrimary),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
          ),
        ),
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
      ),
      controller: widget.passwordInputController,
    );
  }
}

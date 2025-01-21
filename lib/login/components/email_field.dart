import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController usernameInputController;
  final String? Function(String?)? usernameValidator;

  const UsernameField({
    super.key,
    required this.usernameInputController,
    required this.usernameValidator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: usernameValidator,
      decoration: InputDecoration(
        hintText: "Nome de Usuário",
        prefixIcon:
            Icon(Icons.person, color: Theme.of(context).colorScheme.onPrimary),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.onPrimary),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
          ),
        ),
      ),
      controller: usernameInputController,
    );
  }
}

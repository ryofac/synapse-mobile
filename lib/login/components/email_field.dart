import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailInputController;

  const EmailField({
    super.key,
    required this.emailInputController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: (input) => input != null && input.length < 4
          ? "A senha deve ser maior que 4 caracteres"
          : null,
      decoration: InputDecoration(
        hintText: "Endereço de Email",
        prefixIcon:
            Icon(Icons.email, color: Theme.of(context).colorScheme.onPrimary),
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
      controller: emailInputController,
    );
  }
}

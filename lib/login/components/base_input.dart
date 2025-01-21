import 'package:flutter/material.dart';

class BaseInputField extends StatelessWidget {
  final TextEditingController inputController;
  final String? Function(String?)? inputValidator;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;

  const BaseInputField({
    super.key,
    required this.inputController,
    required this.keyboardType,
    required this.inputValidator,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: inputValidator,
      obscureText: obscureText,
      controller: inputController,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon ??
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
        suffixIcon: suffixIcon,
      ),
    );
  }
}

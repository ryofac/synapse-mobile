import 'package:flutter/material.dart';

class BaseForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final String formTitle;
  final String? description;
  final void Function() submitHandler;
  final List<Widget> fields;
  final Widget? buttonChild;

  const BaseForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.submitHandler,
    required this.fields,
    this.buttonChild,
    required this.formTitle,
    this.description,
  }) : _formKey = formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).hintColor.withOpacity(0.2),
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
                formTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            description != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      description!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 20),
            Column(
              children: fields,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  minimumSize: const Size(double.infinity, 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  submitHandler();
                }
              },
              child: buttonChild,
            ),
          ],
        ),
      ),
    );
  }
}

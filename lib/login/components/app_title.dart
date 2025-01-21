import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String title;
  const AppTitle({
    super.key,
    this.title = "Synapse",
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

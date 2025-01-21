import 'package:flutter/material.dart';
import 'package:synapse/login/components/app_title.dart';

class AppMainHeader extends StatelessWidget {
  final String title;
  final String description;
  const AppMainHeader({
    super.key,
    required this.description,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTitle(title: title),
        const SizedBox(height: 12),
        SizedBox(
          width: 342,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}

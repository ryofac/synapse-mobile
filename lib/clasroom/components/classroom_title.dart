import 'package:flutter/material.dart';

class TopicTitle extends StatelessWidget {
  final String name;

  const TopicTitle({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
          fontSize: 36,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
    );
  }
}

import 'package:flutter/material.dart';

class ClassroomTitle extends StatelessWidget {
  const ClassroomTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Turmas",
      style: TextStyle(
          fontSize: 36,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
    );
  }
}

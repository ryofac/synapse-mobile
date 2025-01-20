import 'package:flutter/material.dart';
import 'package:synapse/clasroom/ui/classroom_ui.dart';

class ClassroomContainer extends StatefulWidget {
  const ClassroomContainer({super.key});

  @override
  State<ClassroomContainer> createState() => _ClassroomContainerState();
}

class _ClassroomContainerState extends State<ClassroomContainer> {
  @override
  Widget build(BuildContext context) {
    return const ClassroomUi();
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:synapse/clasroom/models/classroom_model.dart';
import 'package:synapse/clasroom/repositories/classroom_repository.dart';
import 'package:synapse/clasroom/ui/classroom_ui.dart';

class ClassroomContainer extends StatefulWidget {
  const ClassroomContainer({super.key});

  @override
  State<ClassroomContainer> createState() => _ClassroomContainerState();
}

class _ClassroomContainerState extends State<ClassroomContainer> {
  final ClassroomRepository classRepository = ClassroomRepository();
  List<ClassroomModel> classrooms = [];
  bool classesReady = false;

  @override
  void initState() {
    super.initState();
    _populateClassrooms();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _populateClassrooms();
  }

  Future _populateClassrooms() async {
    var allClassrooms = await classRepository.getAllClassrooms();
    setState(() {
      classrooms = List.from(allClassrooms);
      classesReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClassroomUi(
      classesReady: classesReady,
      classrooms: classrooms,
      onRefreshCallback: _populateClassrooms,
    );
  }
}

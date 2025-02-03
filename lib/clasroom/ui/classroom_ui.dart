import 'package:flutter/material.dart';
import 'package:synapse/clasroom/models/classroom_model.dart';
import 'package:synapse/clasroom/ui/tabs/about_tab.dart';
import 'package:synapse/clasroom/ui/tabs/classroom_list_tab.dart';

class ClassroomUi extends StatefulWidget {
  final bool classesReady;
  final List<ClassroomModel> classrooms;
  final Future Function() onRefreshCallback;
  const ClassroomUi({
    super.key,
    required this.classesReady,
    required this.classrooms,
    required this.onRefreshCallback,
  });

  @override
  State<ClassroomUi> createState() => _ClassroomUiState();
}

class _ClassroomUiState extends State<ClassroomUi>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // title: const Text("Synapse"),
          bottom: const TabBar(tabs: [
            Tab(child: Text("Turmas")),
            Tab(child: Text("Sobre")),
          ]),
        ),
        body: TabBarView(
          children: [
            ClassroomListTab(
              classesReady: widget.classesReady,
              classrooms: widget.classrooms,
              onRefreshCallback: widget.onRefreshCallback,
            ),
            const AboutTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add_circle_outline_rounded),
        ),
      ),
    );
  }
}

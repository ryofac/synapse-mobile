import 'package:flutter/material.dart';
import 'package:synapse/clasroom/ui/tabs/about_tab.dart';
import 'package:synapse/clasroom/ui/tabs/classroom_list_tab.dart';

class ClassroomUi extends StatefulWidget {
  const ClassroomUi({super.key});

  @override
  State<ClassroomUi> createState() => _ClassroomUiState();
}

class _ClassroomUiState extends State<ClassroomUi>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // title: const Text("Synapse"),
          bottom: const TabBar(tabs: [
            Tab(child: Text("Turmas")),
            Tab(child: Text("Sobre")),
          ]),
        ),
        body: const TabBarView(
          children: [
            ClassroomListTab(),
            AboutTab(),
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

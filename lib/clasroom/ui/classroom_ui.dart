import 'package:flutter/material.dart';
import 'package:synapse/clasroom/components/classroom_card.dart';
import 'package:synapse/clasroom/components/classroom_title.dart';

class ClassroomUi extends StatelessWidget {
  const ClassroomUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 76, horizontal: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: ClassroomTitle(),
                )
              ],
            ),
            ClassroomCard(
              title: "Roberto Carlos",
              description: "O rei",
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREcjtS8Z3cmP9WwhBu5ACe5Ac81uXno35tIQ&s",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_circle_outline_rounded),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:synapse/clasroom/components/classroom_card.dart';
import 'package:synapse/clasroom/components/classroom_title.dart';
import 'package:synapse/clasroom/models/classroom_model.dart';
import 'package:synapse/shared/components/loading.dart';

class ClassroomListTab extends StatelessWidget {
  final bool classesReady;
  final List<ClassroomModel> classrooms;

  final Future Function() onRefreshCallback;
  const ClassroomListTab({
    super.key,
    required this.classesReady,
    required this.classrooms,
    required this.onRefreshCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.all(16.0),
            child: const TopicTitle(
              name: "Turmas",
            ),
          ),
        ),
        Expanded(
          child: !classesReady
              ? const Loading()
              : RefreshIndicator(
                  onRefresh: () async {
                    await onRefreshCallback();
                  },
                  child: ListView.builder(
                    itemCount: classrooms.length,
                    itemBuilder: (context, index) {
                      return ClassroomCard(
                        imageUrl:
                            "https://www.alertasecurity.com.br/wp-content/uploads/2021/11/tecnologia-da-informacao-890x500-1-1.jpg",
                        title: classrooms[index].className,
                        description: classrooms[index].className,
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}



//  
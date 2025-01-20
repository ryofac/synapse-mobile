import 'package:flutter/material.dart';
import 'package:synapse/clasroom/components/classroom_card_text.dart';

class ClassroomCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const ClassroomCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: Image.network(
          imageUrl,
          width: double.infinity,
          height: 224,
          fit: BoxFit.fill,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          children: [
            CardText(text: title, type: CardTextTypes.title),
            CardText(text: description, type: CardTextTypes.description),
          ],
        ),
      )
    ]);
  }
}

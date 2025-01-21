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
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).hintColor.withOpacity(0.1),
                  offset: const Offset(0, 0),
                  blurRadius: 20,
                )
              ]),
          child: Column(children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 200,
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
            ),
          ]),
        ),
        const SizedBox(height: 16)
      ],
    );
  }
}

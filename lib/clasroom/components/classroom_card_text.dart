import 'package:flutter/material.dart';

enum CardTextTypes { description, title }

class CardText extends StatelessWidget {
  final String text;
  final CardTextTypes type;

  const CardText({
    super.key,
    this.text = "Card text",
    this.type = CardTextTypes.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: type == CardTextTypes.title
            ? const TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
            : const TextStyle(
                fontSize: 14,
              ),
      ),
    );
  }
}

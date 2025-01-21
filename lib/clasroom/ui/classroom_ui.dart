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
              title: "Programação Web",
              description:
                  "Aprenda os princípios da programação web, incluindo HTML, CSS e JavaScript, para desenvolver aplicações interativas.",
              imageUrl:
                  "https://www.alertasecurity.com.br/wp-content/uploads/2021/11/tecnologia-da-informacao-890x500-1-1.jpg",
            ),
            ClassroomCard(
              title: "Banco de Dados",
              description:
                  "Explore os conceitos de bancos de dados, modelagem de dados e SQL para gerenciar informações de forma eficaz.",
              imageUrl:
                  "https://www.alertasecurity.com.br/wp-content/uploads/2021/11/tecnologia-da-informacao-890x500-1-1.jpg",
            ),
            ClassroomCard(
              title: "Desenvolvimento Mobile",
              description:
                  "Descubra as técnicas para desenvolver aplicativos móveis, incluindo design responsivo e integração com APIs.",
              imageUrl:
                  "https://www.alertasecurity.com.br/wp-content/uploads/2021/11/tecnologia-da-informacao-890x500-1-1.jpg",
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

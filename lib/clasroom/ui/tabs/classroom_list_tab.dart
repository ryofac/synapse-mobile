import 'package:flutter/material.dart';
import 'package:synapse/clasroom/components/classroom_card.dart';
import 'package:synapse/clasroom/components/classroom_title.dart';

class ClassroomListTab extends StatelessWidget {
  const ClassroomListTab({
    super.key,
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
        const Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
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
        ),
      ],
    );
  }
}

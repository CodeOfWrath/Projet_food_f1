import 'package:flutter/material.dart';
import '../widgets/CustomCard.dart';

class DetailScreen extends StatelessWidget {
  final String id;
  DetailScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Détail")),
      body: Center(
        child: CustomCard(
          title: "Recette n° $id",
          content: "Description de la recette sélectionnée.",
        ),
      ),
    );
  }
}

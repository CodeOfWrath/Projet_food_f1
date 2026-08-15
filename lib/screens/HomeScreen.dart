import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/CustomButton.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Accueil")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(label: "Liste", onPressed: () => context.go('/list')),
            CustomButton(label: "Formulaire", onPressed: () => context.go('/form')),
          ],
        ),
      ),
    );
  }
}

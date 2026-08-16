import 'package:flutter/material.dart';
import 'package:film/util/data.dart';

class DetailScreen extends StatelessWidget {
  final String id;
  DetailScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    final recipe = recipes[int.parse(id)];

    return Scaffold(
      appBar: AppBar(title: Text("Détail")),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              'assets/food.jpg', // image générique
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),
            Container(
              color: Colors.black54,
              padding: EdgeInsets.all(16),
              child: Text(
                recipe,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

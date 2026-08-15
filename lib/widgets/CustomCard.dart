import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String content;

  CustomCard({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(content),
          ],
        ),
      ),
    );
  }
}

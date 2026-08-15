import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<String> items = ["Pizza", "Burger", "Salade", "Tacos"];
  String query = "";

  @override
  Widget build(BuildContext context) {
    final filtered = items.where((i) => i.toLowerCase().contains(query.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Recettes")),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Recherche"),
            onChanged: (val) => setState(() => query = val),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filtered[index]),
                  onTap: () => context.go('/detail/$index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

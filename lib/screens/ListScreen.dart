import 'package:film/util/data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<String> items = recipes;
  String query = "";

  @override
  Widget build(BuildContext context) {
    final filtered = items.where((i) => i.toLowerCase().contains(query.toLowerCase())).toList();
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(title: Text("Recettes")),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Recherche"),
            onChanged: (val) => setState(() => query = val),
          ),
          Expanded(
            child: isTablet
                ? GridView.count(
              crossAxisCount: 2,
              children: filtered.map((item) {
                return GestureDetector(
                  onTap: () => context.go('/detail/${items.indexOf(item)}'),
                  child: Card(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(color: Colors.orange.shade100),
                        Text(item, style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            )
                : ListView.builder(
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

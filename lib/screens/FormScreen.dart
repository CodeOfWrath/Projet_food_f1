import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = "", email = "", password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulaire")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Nom"),
                validator: (val) => val!.isEmpty ? "Champ obligatoire" : null,
                onSaved: (val) => name = val!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator: (val) => val!.contains("@") ? null : "Email invalide",
                onSaved: (val) => email = val!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Mot de passe"),
                obscureText: true,
                validator: (val) => val!.length < 6 ? "Min 6 caractères" : null,
                onSaved: (val) => password = val!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Valider"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Formulaire valide ✅")),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

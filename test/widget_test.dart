import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:film/main.dart';

void main() {
  testWidgets('Affichage de l’écran Home', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Vérifie que le bouton "Liste" est présent
    expect(find.text('Liste'), findsOneWidget);
    expect(find.text('Formulaire'), findsOneWidget);
  });

  testWidgets('Navigation vers ListScreen et recherche', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Aller vers l’écran Liste
    await tester.tap(find.text('Liste'));
    await tester.pumpAndSettle();

    // Vérifie que la liste contient "Pizza"
    expect(find.text('Pizza'), findsOneWidget);

    // Tape une recherche
    await tester.enterText(find.byType(TextField), 'Burger');
    await tester.pump();

    // Vérifie que seul "Burger" apparaît
    expect(find.text('Burger'), findsOneWidget);
    expect(find.text('Pizza'), findsNothing);
  });

  testWidgets('Navigation vers DetailScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Aller vers l’écran Liste
    await tester.tap(find.text('Liste'));
    await tester.pumpAndSettle();

    // Cliquer sur le premier élément
    await tester.tap(find.text('Pizza'));
    await tester.pumpAndSettle();

    // Vérifie que l’écran détail s’affiche
    expect(find.textContaining('Recette n°'), findsOneWidget);
  });

  testWidgets('Validation du FormScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Aller vers l’écran Formulaire
    await tester.tap(find.text('Formulaire'));
    await tester.pumpAndSettle();

    // Remplir les champs
    await tester.enterText(find.byType(TextFormField).at(0), 'Jean');
    await tester.enterText(find.byType(TextFormField).at(1), 'jean@example.com');
    await tester.enterText(find.byType(TextFormField).at(2), 'secret123');

    // Soumettre le formulaire
    await tester.tap(find.text('Valider'));
    await tester.pump();

    // Vérifie que le message de succès apparaît
    expect(find.text('Formulaire valide ✅'), findsOneWidget);
  });
}

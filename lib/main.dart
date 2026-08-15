import 'package:film/screens/DetailScreen.dart';
import 'package:film/screens/FormScreen.dart';
import 'package:film/screens/HomeScreen.dart';
import 'package:film/screens/ListScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomeScreen()),
      GoRoute(path: '/list', builder: (context, state) => ListScreen()),
      GoRoute(
        path: '/detail/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return DetailScreen(id: id);
        },
      ),
      GoRoute(path: '/form', builder: (context, state) => FormScreen()),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
    );
  }
}

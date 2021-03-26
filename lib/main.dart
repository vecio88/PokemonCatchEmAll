import 'package:flutter/material.dart';
import 'view/pokedex_regionale.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tool Completa Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokedexRegionale(),
    );
  }
}

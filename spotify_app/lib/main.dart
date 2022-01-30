import 'package:flutter/material.dart';
import 'package:spotify_app/pages/Inicio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Inicio(),
      ),
    );
  }
}

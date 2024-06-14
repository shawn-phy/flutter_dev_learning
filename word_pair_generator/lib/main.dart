import 'package:flutter/material.dart';
import './random_words_generator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Color.fromARGB(255, 25, 6, 99)),
        home: const RandomWords());
  }
}


import 'package:flutter/material.dart';
import 'package:lab4/calculate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EV Calculate',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.purple),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
        useMaterial3: true,
      ),
      home: const Calculate()
    );
  }
}
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const Lettutor());
}

class Lettutor extends StatelessWidget {
  const Lettutor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.blue[800],
        useMaterial3: true,
        brightness: Brightness.light
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue[800],
        useMaterial3: true,
        brightness: Brightness.dark
      ),
      title: "Lettutor",
      home: LoginPage(),
    );
  }
}

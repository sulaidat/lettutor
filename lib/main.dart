// ignore_for_file: prefer_const_constructors, avoid_print

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
        useMaterial3: true,
      ),
      title: "Lettutor",
      home: LoginPage(),
    );
  }
}

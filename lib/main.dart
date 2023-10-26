import 'package:flutter/material.dart';

import 'login_page.dart';
import 'theme/color_schemes.g.dart';

void main() {
  runApp(const Lettutor());
}

class Lettutor extends StatelessWidget {
  const Lettutor({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const LoginPage(),
    );
  }
}

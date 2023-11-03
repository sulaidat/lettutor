import 'package:flutter/material.dart';
import 'package:lettutor/src/app.dart';
import 'package:lettutor/src/login_page.dart';

import 'src/theme/color_schemes.g.dart';

void main() {
  runApp(const MyApp());
}

class Lettutor extends StatelessWidget {
  const Lettutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const LoginPage(),
    );
  }
}

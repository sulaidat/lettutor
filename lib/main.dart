import 'package:flutter/material.dart';
import 'package:lettutor/src/app.dart';
import 'package:lettutor/src/login_page/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: const MyApp(),
    ),
  );
}

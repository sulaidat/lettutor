// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const Lettutor());
}

class Lettutor extends StatelessWidget {
  const Lettutor({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Lettutor",
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Image.asset(
              "assets/imgs/logo.png",
              width: 100,
              height: 100,
            ),
            const Text(
              "Lettutor",
              style: TextStyle(
                  fontSize: 40,
                  color: Color(0xff0f75f1),
                  fontWeight: FontWeight.bold),
            ),
            Form(
              child: Column(
                children: [
                  TextInput(
                    label: "Username",
                    icon: Icon(Icons.person),
                    isPassword: false,
                  ),
                  TextInput(
                    label: "Password",
                    icon: Icon(Icons.key),
                    isPassword: true,
                  ),
                  TextButton(
                    onPressed: () {
                      print("LoginPage::TextButton pressed");
                    },
                    child: Text("Forgot password?"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("Login: button pressed");
                    },
                    child: Text("Login"),
                  ),
                ],
              ),
            ),
            Text("OR"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.facebook),
                Icon(Icons.g_mobiledata),
                Icon(Icons.phone_android)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member yet?"),
                TextButton(
                  onPressed: () {
                    print("LoginPage::TextButton pressed");
                  },
                  child: Text("Register"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  const TextInput(
      {super.key,
      required this.label,
      required this.icon,
      required this.isPassword});

  final String label;
  final Icon icon;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: icon,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.all(0),
        ),
        validator: null,
      ),
    );
  }
}

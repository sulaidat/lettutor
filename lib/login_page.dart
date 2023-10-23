// ignore_for_file: prefer_const_constructors, avoid_print

import 'home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Form(
                child: Column(
                  children: [
                    ProTextFormField(
                      label: "Username",
                      icon: Icon(Icons.person),
                    ),
                    ProPasswordFormField(
                      label: "Password",
                      icon: Icon(Icons.key),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          print("LoginPage::TextButton pressed");
                        },
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                      },
                      child: Text("Login"),
                    ),
                  ],
                ),
              ),
            ),
            Text("OR"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.facebook,
                    size: 25,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.g_translate,
                      size: 25,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.phone_android,
                    size: 25,
                  ),
                ),
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

class ProTextFormField extends StatelessWidget {
  const ProTextFormField({
    super.key,
    required this.label,
    required this.icon,
  });

  final String label;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
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

class ProPasswordFormField extends StatefulWidget {
  const ProPasswordFormField({
    super.key,
    required this.label,
    required this.icon,
  });

  final String label;
  final Icon icon;

  @override
  State<ProPasswordFormField> createState() => _ProPasswordFormFieldState();
}

class _ProPasswordFormFieldState extends State<ProPasswordFormField> {
  bool visibility = false;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
        obscureText: !visibility,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          labelText: widget.label,
          suffixIcon: InkWell(
            onTap: () => setState(() {
              visibility = !visibility;
            }),
            child: Icon(
              // TODO: this icon disappeared everytime app is backed and
              // started again
              visibility
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              // color: Colors.grey.shade700,
            ),
          ),
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

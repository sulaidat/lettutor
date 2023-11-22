import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/login_page/auth.dart';
import 'package:lettutor/src/login_page/password_field_model.dart';
import 'package:lettutor/src/login_page/username_field_model.dart';

import 'pro_password_form_field.dart';
import 'pro_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final usernameModel = UsernameFieldModel();
    final passwordModel = PasswordFieldModel();
    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Image.asset(
              "assets/imgs/logo.png",
              width: 100,
              height: 100,
            ),
            Text(
              "Lettutor",
              style: theme.textTheme.displayMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    ProTextFormField(
                      label: "Username",
                      icon: Icon(Icons.person),
                      model: usernameModel,
                    ),
                    ProPasswordFormField(
                      label: "Password",
                      icon: Icon(Icons.key),
                      model: passwordModel,
                    ),
                    ProPasswordFormField(
                      label: "Confirm password",
                      icon: Icon(Icons.key),
                      model: passwordModel,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          print("RegisterPage::TextButton pressed");
                        },
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: theme.colorScheme.tertiary,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("RegisterPage::ElevatedButton pressed");
                        if (formKey.currentState!.validate()) {
                          var auth = AuthService();
                          auth.register(usernameModel.controller!.value.text,
                              passwordModel.controller!.value.text);
                          context.go('/login');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Registered')),
                          );
                        }
                      },
                      child: Text("Register"),
                    ),
                  ],
                ),
              ),
            ),
            Text("Or register with (not working)"),
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
                Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    context.go('/login');
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

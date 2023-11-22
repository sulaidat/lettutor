import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/login_page/auth.dart';
import 'package:lettutor/src/login_page/password_field_model.dart';
import 'package:lettutor/src/login_page/pro_password_form_field.dart';
import 'package:lettutor/src/login_page/pro_text_form_field.dart';
import 'package:lettutor/src/login_page/username_field_model.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key, required this.onLogIn});

  // final Function(Account) onLogIn;
  final Function(String, String) onLogIn;

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                      label: "Create password",
                      icon: Icon(Icons.key),
                      model: passwordModel,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          print("ForgotPasswordPage::TextButton pressed");
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
                        if (formKey.currentState!.validate()) {
                          var auth = AuthService();
                          auth.logIn(usernameModel.controller?.value.text ?? '',
                              passwordModel.controller?.value.text ?? '');
                          context.go('/list/all');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: Text("Login"),
                    ),
                  ],
                ),
              ),
            ),
            Text("Or register with"),
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
                    context.go('/register');
                  },
                  child: Text(
                    "Register",
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

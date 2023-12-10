import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/api/api.dart';
import 'package:lettutor/src/login_page/auth.dart';
import 'package:lettutor/src/login_page/password_field_model.dart';
import 'package:lettutor/src/login_page/pro_password_form_field.dart';
import 'package:lettutor/src/login_page/pro_text_form_field.dart';
import 'package:lettutor/src/login_page/username_field_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                          print("Forgot password button pressed");
                          context.push('/forgot_password');
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
                        var auth = AuthService();
                        auth.onLogin = true;
                        if (formKey.currentState!.validate()) {
                          auth.logIn(usernameModel.controller?.value.text ?? '',
                              passwordModel.controller?.value.text ?? '');
                          _login(usernameModel.controller!.value.text,
                              passwordModel.controller!.value.text, context);
                        }
                        auth.onLogin = false;
                      },
                      child: Text("Login"),
                    ),
                  ],
                ),
              ),
            ),
            Text("Or login with (not working)"),
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

  void _login(String email, String password, BuildContext context) async {
    final api = Api();
    final user = await api.login(email, password, context);
    if (context.mounted) {
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Logged in')),
        );
        var auth = AuthService();
        auth.isLoggedIn = true;
        context.go('/list/all');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed')),
        );
      }
    }
  }
}

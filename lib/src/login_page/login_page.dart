import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/api/auth_api.dart';
import 'package:lettutor/src/login_page/auth.dart';
import 'package:lettutor/src/login_page/password_field_model.dart';
import 'package:lettutor/src/login_page/pro_password_form_field.dart';
import 'package:lettutor/src/login_page/pro_text_form_field.dart';
import 'package:lettutor/src/login_page/username_field_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailModel = UsernameFieldModel();
  final passwordModel = PasswordFieldModel();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                      model: emailModel,
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
                        AppState.onLogin = true;
                        if (formKey.currentState!.validate()) {
                          _login((success, e) {
                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Login success"),
                                ),
                              );
                              context.go('/tutor/all');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(e.toString()),
                                ),
                              );
                            }
                          });
                        }
                        AppState.onLogin = false;
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

  void _login(Function(bool, dynamic) hook) async {
    try {
      final email = emailModel.controller!.value.text;
      final password = passwordModel.controller!.value.text;
      final (user, token) = await AuthApi.login(
        email: email,
        password: password,
      );
      AppState.isLoggedIn = true;
      AppState.user = user;
      AppState.token = token;
      var pref = await SharedPreferences.getInstance();
      pref.setString("refresh_token", token.refresh!.token!);
      hook(true, '');
    } catch (e) {
      hook(false, e);
    }
  }
}

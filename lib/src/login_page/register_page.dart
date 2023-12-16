import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/api/auth_api.dart';
import 'package:lettutor/src/login_page/password_field_model.dart';
import 'package:lettutor/src/login_page/pro_confirm_password_form_field.dart';
import 'package:lettutor/src/login_page/username_field_model.dart';
import 'package:lettutor/src/models/user/token.dart';
import 'package:lettutor/src/models/user/user.dart';

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
    final confirmPasswordModel = ConfirmPasswordFieldModel();
    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                    ProConfirmPasswordFormField(
                      label: "Confirm password",
                      icon: Icon(Icons.key),
                      model: confirmPasswordModel,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          print("RegisterPage->forgot password button pressed");
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
                        if (formKey.currentState!.validate()) {
                          _register(
                            usernameModel.controller!.value.text,
                            passwordModel.controller!.value.text,
                            (success, e) {
                              if (success) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Register success"),
                                  ),
                                );
                                context.go('/verify_account',
                                    extra:
                                        usernameModel.controller!.value.text);
                              } else {
                                print(e);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(e ?? "Register failed"),
                                  ),
                                );
                              }
                            },
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

  void _register(
      String email, String password, Function(bool, String?) hook) async {
    try {
      await AuthApi.register(email: email, password: password);
      hook(true, null);
    } catch (e) {
      hook(false, e.toString());
    }
  }
}

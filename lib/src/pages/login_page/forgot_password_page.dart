import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/api/auth_api.dart';
import 'package:lettutor/src/custom_widgets/pro_heading.dart';
import 'package:lettutor/src/custom_widgets/pro_neg_button.dart';
import 'package:lettutor/src/custom_widgets/pro_pos_button.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController emailController = TextEditingController();

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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Heading1(text: "Forgot password?"),
                  Text("Provide your email to reset your password"),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email",
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  Row(
                    children: [
                      ProNegButton(
                        label: "Cancel",
                        onPressed: () {
                          context.go('/login');
                        },
                      ),
                      Spacer(),
                      ProPosButton(
                        label: "Send reset link",
                        onPressed: () {
                          _sendResetLink(
                            emailController.value.text,
                            (msg) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(msg),
                                ),
                              );
                              context.go('/login');
                            },
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendResetLink(String email, Function(String) hook) async {
    final msg = await AuthApi.forgotPassword(email: email);
    hook(msg);
  }
}

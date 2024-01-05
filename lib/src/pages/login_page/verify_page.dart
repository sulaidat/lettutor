import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/custom_widgets/pro_heading.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key, required this.email});

  final String email;

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
                  Heading1(text: "Check your email"),
                  Text("We've sent an email to $email\n"
                      "Please click the link in the email to verify your account"),
                  ElevatedButton(
                    onPressed: () {
                      context.go('/login');
                    },
                    child: Text("Back to login"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

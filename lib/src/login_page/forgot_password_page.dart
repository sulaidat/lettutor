import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/login_page/auth.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
                validator: (value) {
                  var auth = AuthService();
                  if (auth.userExists(emailController.text) == false) {
                    return 'Email does not exist';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    var auth = AuthService();
                    auth.sendPasswordResetEmail(
                        emailController.text); // do nothing
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Password reset email sent')),
                    );
                    context.go('/reset_password');
                  }
                },
                child: Text('Send Password Reset Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

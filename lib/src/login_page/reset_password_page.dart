import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/login_page/auth.dart';
import 'package:lettutor/src/login_page/password_field_model.dart';
import 'package:lettutor/src/login_page/pro_confirm_password_form_field.dart';
import 'package:lettutor/src/login_page/pro_password_form_field.dart';
import 'package:lettutor/src/login_page/pro_text_form_field.dart';
import 'package:lettutor/src/login_page/username_field_model.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameModel = UsernameFieldModel();
    final passwordModel = PasswordFieldModel();
    final confirmPasswordModel = ConfirmPasswordFieldModel();
    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Reset Password')),
        body: Column(
          children: [
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
                      readOnly: true,
                    ),
                    ProPasswordFormField(
                      label: "New password",
                      icon: Icon(Icons.key),
                      model: passwordModel,
                    ),
                    ProConfirmPasswordFormField(
                      label: "Confirm password",
                      icon: Icon(Icons.key),
                      model: confirmPasswordModel,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("Confirm button pressed");
                        // var auth = Auth();
                        // auth.onReset = true;
                        // if (formKey.currentState!.validate()) {
                        //   auth.changePassword(
                        //       usernameModel.controller!.value.text,
                        //       passwordModel.controller!.value.text);
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text('Password reseted')),
                        //   );
                        //   context.go('/login');
                        // }
                        // auth.onReset = false;
                      },
                      child: Text("Confirm"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

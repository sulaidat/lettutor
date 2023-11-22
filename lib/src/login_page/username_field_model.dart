import 'package:flutter/material.dart';
import 'package:lettutor/src/login_page/auth.dart';

class UsernameFieldModel {
  TextEditingController? controller;
  String? Function(String?)? validator;

  static final UsernameFieldModel _instance = UsernameFieldModel._internal();

  factory UsernameFieldModel() {
    return _instance;
  }

  UsernameFieldModel._internal() {
    controller = TextEditingController();
    validator = (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter an email';
      }
      if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
          .hasMatch(value)) {
        return 'Please enter a valid email address';
      }
      var auth = AuthService();
      if (auth.onLogin) {
        if (auth.userExistsForLogin(value)) {
          return null;
        } else {
          return 'This email is not registered';
        }
      } else {
        if (auth.userExists(value)) {
          return 'This email is already registered';
        }
      }
      return null;
    };
  }
}

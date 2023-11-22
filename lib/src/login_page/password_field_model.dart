import 'package:flutter/material.dart';

class PasswordFieldModel {
  TextEditingController? controller;
  String? Function(String?)? validator;

  static final PasswordFieldModel _instance = PasswordFieldModel._internal();

  factory PasswordFieldModel() {
    return _instance;
  }

  PasswordFieldModel._internal() {
    controller = TextEditingController();
    validator = (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a password';
      }
      if (value.length < 8) {
        return 'Password must be at least 8 characters long';
      }
      if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
          .hasMatch(value)) {
        return 'Password must contain at least one uppercase letter, one lowercase letter, and one digit';
      }
      return null;
    };
  }
}

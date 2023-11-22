import 'package:flutter/material.dart';
import 'package:lettutor/src/login_page/username_field_model.dart';

class ProTextFormField extends StatelessWidget {
  const ProTextFormField({
    super.key,
    required this.label,
    required this.icon,
    required this.model,
  });

  final Icon icon;
  final String label;
  final UsernameFieldModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: icon,
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey.shade700,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.all(0),
        ),
        controller: model.controller,
        validator: model.validator,
      ),
    );
  }
}

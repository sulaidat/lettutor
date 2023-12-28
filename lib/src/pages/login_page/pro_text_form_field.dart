import 'package:flutter/material.dart';
import 'package:lettutor/src/pages/login_page/username_field_model.dart';

class ProTextFormField extends StatelessWidget {
  const ProTextFormField({
    super.key,
    required this.label,
    required this.icon,
    required this.model,
    this.readOnly = false,
  });

  final Icon icon;
  final String label;
  final UsernameFieldModel model;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
        readOnly: readOnly,
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

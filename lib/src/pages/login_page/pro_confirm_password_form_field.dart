import 'package:flutter/material.dart';
import 'package:lettutor/src/pages/login_page/password_field_model.dart';

class ProConfirmPasswordFormField extends StatefulWidget {
  const ProConfirmPasswordFormField({
    super.key,
    required this.label,
    required this.icon,
    required this.model,
  });

  final Icon icon;
  final String label;
  final ConfirmPasswordFieldModel model;

  @override
  State<ProConfirmPasswordFormField> createState() => _ProConfirmPasswordFormFieldState();
}

class _ProConfirmPasswordFormFieldState extends State<ProConfirmPasswordFormField> {
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
        obscureText: !visibility,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          labelText: widget.label,
          labelStyle: TextStyle(
            color: Colors.grey.shade700,
          ),
          suffixIcon: InkWell(
            onTap: () => setState(() {
              visibility = !visibility;
            }),
            child: Icon(
              visibility
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              // color: Colors.grey.shade700,
            ),
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
        controller: widget.model.controller,
        validator: widget.model.validator,
      ),
    );
  }
}

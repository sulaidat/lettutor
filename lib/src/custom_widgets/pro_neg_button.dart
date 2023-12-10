import 'package:flutter/material.dart';

class ProNegButton extends StatelessWidget {
  const ProNegButton({
    Key? key,
    required this.label,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final Icon? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.red),
      ),
      child: Row(
        children: [
          icon ?? SizedBox.shrink(),
          Text(
            label,
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}

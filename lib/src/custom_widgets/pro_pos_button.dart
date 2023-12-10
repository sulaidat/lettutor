import 'package:flutter/material.dart';

class ProPosButton extends StatelessWidget {
  const ProPosButton({
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
    return FilledButton(
      onPressed: onPressed,
      child: Row(
        children: [
          icon ?? SizedBox.shrink(),
          Text(label),
        ],
      ),
    );
  }
}

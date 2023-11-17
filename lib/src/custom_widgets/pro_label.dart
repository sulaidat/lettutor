import 'package:flutter/material.dart';

class ProLabel extends StatelessWidget {
  const ProLabel(
      {Key? key,
      required this.icon,
      required this.label,
      this.color})
      : super(key: key);

  final Color? color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Icon(icon),
        Text(
          label,
          style: theme.textTheme.labelMedium,
        )
      ],
    );
  }
}

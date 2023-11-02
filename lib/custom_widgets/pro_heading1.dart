import 'package:flutter/material.dart';
import 'package:lettutor/helpers/padding.dart';

class ProHeading1 extends StatelessWidget {
  const ProHeading1({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        vpad(10),
        Text(
          text,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
      ],
    );
  }
}

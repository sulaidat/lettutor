import 'package:flutter/material.dart';

class ProHeader extends StatelessWidget {
  const ProHeader({super.key, this.start, required this.title, this.end});

  final Widget? start, end;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 50,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          start ??
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.chevron_left,
                  size: 30,
                  color: theme.colorScheme.primary,
                ),
              ),
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                  // color: theme.colorScheme.primary,
                  ),
            ),
          ),
          end ?? SizedBox.shrink(),
        ],
      ),
    );
  }
}

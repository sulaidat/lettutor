import 'package:flutter/material.dart';

class ProToggleButton extends StatelessWidget {
  const ProToggleButton(
      {Key? key,
      required this.onPressed,
      required this.selectedIcon,
      required this.unselectedIcon,
      required this.isSelected,
      this.label,
      this.color,
      this.style})
      : super(key: key);

  final Color? color;
  final bool isSelected;
  final String? label;
  final VoidCallback onPressed;
  final IconData selectedIcon;
  final ButtonStyle? style;
  final IconData unselectedIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: style ?? ElevatedButton.styleFrom(),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSelected ? selectedIcon : unselectedIcon,
            color: color,
          ),
          label == null
              ? SizedBox.shrink()
              : Text(
                  "$label",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelMedium,
                ),
        ],
      ),
    );
  }
}

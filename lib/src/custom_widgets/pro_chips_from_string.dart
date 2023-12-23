import 'package:flutter/material.dart';

class ProChipsFromList extends StatelessWidget {
  const ProChipsFromList({
    super.key,
    required this.list,
  });

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
          spacing: 0,
          runSpacing: 0,
          children: list.map((e) => ProChip(label: e)).toList()),
    );
  }
}

class ProChip extends StatelessWidget {
  ProChip({
    super.key,
    required this.label,
    this.hook
  });

  final String label;
  Function? hook;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Chip(
      visualDensity: VisualDensity.compact,
      side: BorderSide(color: Colors.transparent),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
      // backgroundColor: Colors.blue[100],
      backgroundColor: theme.colorScheme.secondaryContainer,
      label: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: theme.colorScheme.onSecondaryContainer,
          // fontSize: 15,
        ),
      ),
    );
  }
}

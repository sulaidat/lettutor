import 'package:flutter/material.dart';

class ProChoiceChip extends StatefulWidget {
  const ProChoiceChip(
      {super.key,
      required this.all,
      required this.selected,
      required this.hook});

  final Set<String> all;
  final String selected;
  final ValueChanged<String?> hook;

  @override
  State<ProChoiceChip> createState() => _ProChoiceChipState();
}

class _ProChoiceChipState extends State<ProChoiceChip> {
  String? choice;

  @override
  void initState() {
    super.initState();
    choice = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 0,
        runSpacing: 0,
        children: widget.all.map((e) {
          bool isSelected = choice == e;
          return ChoiceChip(
            label: Text(
              e,
              style: TextStyle(
                fontSize: 12,
                color: isSelected
                    ? theme.colorScheme.onPrimary // Updated label color
                    : theme.colorScheme.onSecondaryContainer,
              ),
            ),
            selected: choice == e,
            onSelected: (bool selected) {
              setState(() {
                choice = selected ? e : null;
              });
              widget.hook(choice);
            },
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200),
            ),
            visualDensity: VisualDensity.compact,
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            selectedColor: Theme.of(context).colorScheme.primary,
          );
        }).toList(),
      ),
    );
  }
}


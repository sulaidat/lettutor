import 'package:flutter/material.dart';

class ProFilterChip extends StatefulWidget {
  const ProFilterChip(
      {super.key,
      required this.all,
      required this.selected,
      required this.hook});

  final List<String> all;
  final List<String> selected;
  final ValueChanged<Set<String>> hook;

  @override
  State<ProFilterChip> createState() => _ProFilterChipState();
}

class _ProFilterChipState extends State<ProFilterChip> {
  Set<String> filter = {};
  @override
  void initState() {
    super.initState();
    filter = widget.selected.toSet();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 0,
        runSpacing: 0,
        children: widget.all.map((e) {
          // print(filter);
          // print(e);
          bool isSelected = filter.contains(e);
          return FilterChip(
            label: Text(
              e,
              style: TextStyle(
                fontSize: 12,
                color: isSelected
                    ? theme.colorScheme.onPrimary // Updated label color
                    : theme.colorScheme.onSecondaryContainer,
              ),
            ),
            selected: isSelected,
            onSelected: (bool value) {
              print(value);
              setState(() {
                if (value) {
                  filter.add(e);
                } else {
                  filter.remove(e);
                }
              });
              widget.hook(filter);
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
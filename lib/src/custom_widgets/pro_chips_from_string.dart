import 'package:flutter/material.dart';

class ProChipsFromList extends StatefulWidget {
  const ProChipsFromList({
    Key? key,
    required this.all,
    required this.selected,
    required this.onSelect,
    required this.onUnselect,
    this.disabled = true,
  }) : super(key: key);

  final List<String> all;
  final List<String> selected;
  final ValueChanged<String> onSelect;
  final ValueChanged<String> onUnselect;
  final bool disabled;
  @override
  State<ProChipsFromList> createState() => _ProChipsFromListState();
}

class _ProChipsFromListState extends State<ProChipsFromList> {
  @override
  Widget build(BuildContext context) {
    // print("rebuild chips");
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 0,
        runSpacing: 0,
        children: _genChips(
          widget.all,
          widget.selected,
          widget.disabled,
          widget.onSelect,
          widget.onUnselect,
        ),
      ),
    );
  }
}

List<ProChip> _genChips(List<String> all, List<String> selected, bool disabled,
    ValueChanged<String> onSelect, ValueChanged<String> onUnselect) {
  List<ProChip> res = [];
  for (var label in all) {
    var isToggled = selected.contains(label);
    res.add(ProChip(
      label: label,
      onTap: isToggled ? onUnselect : onSelect,
      disabled: disabled,
      isToggled: isToggled,
    ));
  }
  return res;
}

class ProChip extends StatefulWidget {
  const ProChip({
    Key? key,
    required this.label,
    required this.onTap,
    this.disabled = false, // Added disabled property
    this.isToggled = false,
  }) : super(key: key);

  final String label;
  final ValueChanged<String> onTap;
  final bool disabled; // Added disabled property
  final bool isToggled;

  @override
  _ProChipState createState() => _ProChipState();
}

class _ProChipState extends State<ProChip> {
  late bool _isToggled;

  @override
  Widget build(BuildContext context) {
    _isToggled = widget.isToggled;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 2), // Updated padding value
      child: GestureDetector(
        onTap: widget.disabled
            ? null
            : () {
                // Updated onTap callback
                setState(() {
                  _isToggled = !_isToggled;
                });
                widget.onTap(widget.label);
              },
        child: Chip(
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          side: BorderSide.none,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
          backgroundColor: _isToggled
              ? theme.colorScheme.primary // Updated background color
              : theme.colorScheme.secondaryContainer,
          label: Text(
            widget.label,
            style: TextStyle(
              fontSize: 12,
              color: _isToggled
                  ? theme.colorScheme.onPrimary // Updated label color
                  : theme.colorScheme.onSecondaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}

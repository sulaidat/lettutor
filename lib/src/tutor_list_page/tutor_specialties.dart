// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';

class ProChipsFromString extends StatelessWidget {
  const ProChipsFromString({
    super.key,
    required this.string,
  });

  final String string;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
          spacing: 0, runSpacing: 0, children: _genSpecialtiesChips(string)),
    );
  }
}

List<ProChip> _genSpecialtiesChips(String specialtiesString) {
  List<ProChip> list = [];
  var specialties = specialtiesString.split(',');
  specialties.forEach((element) {
    if (element.trim() != "") {
      list.add(ProChip(label: element.trim()));
    }
  });
  return list;
}

class ProChip extends StatelessWidget {
  const ProChip({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
      // padding: const EdgeInsets.all(8.0),
      child: Chip(
        visualDensity: VisualDensity(
          horizontal: -4,
          vertical: -4,
        ),
        // padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        // padding: EdgeInsets.all(0),
        side: BorderSide(color: Colors.transparent),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
        // backgroundColor: Colors.blue[100],
        backgroundColor: theme.colorScheme.secondaryContainer,
        label: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            // color: Colors.blue[800],
            color: theme.colorScheme.onSecondaryContainer,
            // fontSize: 15,
          ),
        ),
      ),
    );
  }
}

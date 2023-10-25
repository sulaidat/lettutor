// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';

class TutorSpecialties extends StatelessWidget {
  const TutorSpecialties({
    super.key,
    required this.specialtiesString,
  });

  final String specialtiesString;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
          spacing: 0,
          runSpacing: 0,
          children: _genSpecialtiesChips(specialtiesString)),
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
        backgroundColor: Colors.blue[100],
        label: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.blue[800],
            // fontSize: 15,
          ),
        ),
      ),
    );
  }
}

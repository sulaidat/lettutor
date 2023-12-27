import 'package:flutter/material.dart';

Widget vpad(double height) {
  return SizedBox(
    height: height,
  );
}

Widget hpad(double width) {
  return SizedBox(
    width: width,
  );
}

void to(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

List<String> str2list(String str) {
  return str.split(',').map((e) => e.trim()).toList();
}
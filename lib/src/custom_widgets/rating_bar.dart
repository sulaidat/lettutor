import 'package:flutter/material.dart';
import 'package:lettutor/src/helpers/padding.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    List<Widget> row = List<Widget>.generate(
        rating.round(),
        (index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ));
    row.add(hpad(5));
    row.add(Text(rating.toStringAsFixed(1)));

    return Row(children: row);
  }
}

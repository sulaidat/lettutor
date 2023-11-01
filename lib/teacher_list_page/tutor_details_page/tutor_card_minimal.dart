import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/helpers/padding.dart';
import 'package:lettutor/models/tutor.dart';

class TutorCardMinimal extends StatelessWidget {
  const TutorCardMinimal({
    super.key,
    required this.tutor,
  });

  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: Image.asset(
            "${tutor.imageUrl}",
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        hpad(10),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${tutor.name}",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onBackground,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.flag),
                  Text("Vietnam"),
                ],
              ),
              RatingBarIndicator(
                itemBuilder: (context, index) => Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                ),
                rating: 3,
                unratedColor: Colors.grey,
                itemCount: 5,
                itemSize: 20.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

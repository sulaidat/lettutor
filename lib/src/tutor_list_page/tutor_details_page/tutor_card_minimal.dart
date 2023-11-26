import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/models/tutor.dart';
import 'package:lettutor/src/models/tutor_list.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/pro_fav_toggle_icon.dart';

class TutorCardMinimal extends StatefulWidget {
  const TutorCardMinimal({
    super.key,
    required this.tutor,
  });

  final Tutor tutor;

  @override
  State<TutorCardMinimal> createState() => _TutorCardMinimalState();
}

class _TutorCardMinimalState extends State<TutorCardMinimal> {
  late bool isFavorite;
  late TutorList tutorList;

  @override
  void initState() {
    super.initState();
    tutorList = context.read<TutorList>();
    isFavorite = tutorList.isFavorite(widget.tutor.id);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: Image.network(
            "${widget.tutor.imageUrl}",
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
                "${widget.tutor.name}",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onBackground,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.flag),
                  Text("${widget.tutor.country}"),
                ],
              ),
              Row(
                children: [
                  RatingBarIndicator(
                    itemBuilder: (context, index) => Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                    ),
                    rating: widget.tutor.rating!,
                    unratedColor: Colors.grey,
                    itemCount: 5,
                    itemSize: 20.0,
                  ),
                  hpad(5),
                  Text(widget.tutor.rating!.toStringAsFixed(1)),
                ],
              ),
            ],
          ),
        ),
        ProFavToggleIcon(
          tutorId: widget.tutor.id,
          hook: (isToggled) {},
        )
      ],
    );
  }
}

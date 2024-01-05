import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/api/tutor_api.dart';
import 'package:lettutor/src/custom_widgets/rating_bar.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/pages/login_page/auth.dart';
import 'package:lettutor/src/models/tutor/tutor_info.dart';

class TutorCardMinimal extends StatefulWidget {
  const TutorCardMinimal({
    super.key,
    required this.tutorInfo,
  });

  final TutorInfo tutorInfo;

  @override
  State<TutorCardMinimal> createState() => _TutorCardMinimalState();
}

class _TutorCardMinimalState extends State<TutorCardMinimal> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.tutorInfo.isFavorite!;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          width: 70,
          height: 70,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: CachedNetworkImage(
            imageUrl: "${widget.tutorInfo.user!.avatar}",
            fit: BoxFit.cover,
            errorWidget: (context, url, error) =>
                const Icon(Icons.person, size: 32),
          ),
        ),
        hpad(10),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.tutorInfo.user!.name}",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onBackground,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.flag),
                  Text(countryList[widget.tutorInfo.user!.country] ??
                      'Unknown country'),
                ],
              ),
              widget.tutorInfo.rating == null
                  ? Text("No rating")
                  : RatingBar(rating: widget.tutorInfo.rating!),
            ],
          ),
        ),
        IconButton(
            onPressed: () async {
              setState(() {
                _isFavorite = !_isFavorite;
              });
              try {
                await TutorApi.changeFavorite(
                  token: AppState.token.access!.token!,
                  tutorId: widget.tutorInfo.user!.id!,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(_isFavorite
                        ? "Added to favorite"
                        : "Removed from favorite"),
                    duration: Duration(seconds: 1),
                  ),
                );
                // _fetchTutorInfo(); // NOTE: use this is slow, we trust the apit addTutorToFavorite
              } catch (e) {
                print(e.toString());
                setState(() {
                  _isFavorite = !_isFavorite;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(e.toString()),
                    duration: Duration(seconds: 1),
                  ),
                );
              }
            },
            icon: _isFavorite
                ? Icon(Icons.favorite, color: Colors.red)
                : Icon(Icons.favorite_border, color: Colors.grey)),
      ],
    );
  }
}

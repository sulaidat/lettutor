import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/api/tutor_api.dart';
import 'package:lettutor/src/custom_widgets/pro_chips_from_string.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/login_page/auth.dart';
import 'package:lettutor/src/models/tutor/tutor.dart';
import 'package:lettutor/src/models/tutor/tutor_info.dart';
import 'package:lettutor/src/routes.dart';

import '../custom_widgets/rating_bar.dart';

class TutorCard extends StatefulWidget {
  const TutorCard({super.key, required this.tutor});

  final Tutor tutor;

  @override
  State<TutorCard> createState() => _TutorCardState();
}

class _TutorCardState extends State<TutorCard> {
  bool _shouldFetch = true;
  late TutorInfo _tutorInfo;
  late Tutor _tutor;

  _fetchTutorInfo() async {
    try {
      final res = await TutorApi.getTutorInfoById(
          token: AppState.token.access!.token!, tutorId: widget.tutor.userId!);
      setState(() {
        _tutorInfo = res;
        _shouldFetch = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (_shouldFetch) {
      _fetchTutorInfo();
    }

    return GestureDetector(
      onTap: () {
        context
            .pushNamed(routeName['/tutor/detail']!,
                queryParameters: {'tutorId': _tutorInfo.user!.id},
                extra: widget.tutor)
            .then((value) {
          setState(() {
            // _shouldFetch = true;
          });
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.grey,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    width: 70,
                    height: 70,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: CachedNetworkImage(
                      imageUrl: "${widget.tutor.avatar}",
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.person, size: 32),
                    )),
                hpad(5),
                Expanded(
                  child: Column(
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
                      widget.tutor.rating == null
                          ? Text("No rating")
                          : RatingBar(rating: widget.tutor.rating!),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() async {
                        await TutorApi.changeFavorite(
                          token: AppState.token.access!.token!,
                          tutorId: widget.tutor.userId!,
                        ).then((value) {
                          widget.tutor.isFavoriteTutor = value == true;
                        });
                      });
                      // try {
                      //   await TutorApi.changeFavorite(
                      //     token: AppState.token.access!.token!,
                      //     tutorId: widget.tutor.userId!,
                      //   );
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text(_isFavorite
                      //           ? "Added to favorite"
                      //           : "Removed from favorite"),
                      //       duration: Duration(seconds: 1),
                      //     ),
                      //   );
                      //   // _fetchTutorInfo(); // NOTE: use this is slow, we trust the apit addTutorToFavorite
                      // } catch (e) {
                      //   print(e.toString());
                      //   setState(() {
                      //     _isFavorite = !_isFavorite;
                      //   });
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text(e.toString()),
                      //       duration: Duration(seconds: 1),
                      //     ),
                      //   );
                      // }
                    },
                    icon: widget.tutor.isFavoriteTutor ?? false
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                          )),
                // ProFavToggleIcon(
                //   tutorId: widget.tutor.id!,
                //   hook: (isToggled) async {},
                // )
              ],
            ),
            vpad(5),
            ProChipsFromList(
              list: str2list(widget.tutor.specialties as String),
            ),
            vpad(5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${widget.tutor.bio}",
                maxLines: 4,
                overflow: TextOverflow.fade,
                style: theme.textTheme.bodyMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/api/tutor_api.dart';
import 'package:lettutor/src/custom_widgets/pro_chips_from_string.dart';
import 'package:lettutor/src/custom_widgets/pro_fav_toggle_icon.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/login_page/auth.dart';
import 'package:lettutor/src/models/tutor/tutor.dart';
import 'package:lettutor/src/models/tutor/tutor_info.dart';

class TutorCard extends StatefulWidget {
  const TutorCard({super.key, required this.tutor});

  final Tutor tutor;

  @override
  State<TutorCard> createState() => _TutorCardState();
}

class _TutorCardState extends State<TutorCard> {
  TutorInfo? _tutorInfo;
  bool _isFavorite = false;

  _fetchTutorInfo() async {
    try {
      final res = await TutorApi.getTutorInfoById(
          token: AppState.token.access!.token!, tutorId: widget.tutor.userId!);
      setState(() {
        _tutorInfo = res;
        _isFavorite = _tutorInfo!.isFavorite!;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchTutorInfo();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        context.push('/tutor/${widget.tutor.id}');
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
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(999),
                //   child: CachedNetworkImage(
                //     imageUrl: "${widget.tutor.avatar}",
                //     width: 70,
                //     height: 70,
                //     fit: BoxFit.cover,
                //     errorWidget: (context, url, error) => Icon(
                //       Icons.person,
                //       size: 32,
                //     ),
                //   ),
                // ),
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
                      Row(
                        children: [
                          widget.tutor.rating == null
                              ? Text("No rating")
                              : Row(children: _ratingBar(widget.tutor.rating!)),
                          // RatingBarIndicator(
                          //   itemBuilder: (context, index) => Icon(
                          //     Icons.star_rounded,
                          //     color: Colors.amber,
                          //   ),
                          //   rating: widget.tutor.rating!,
                          //   unratedColor: Colors.grey,
                          //   itemCount: 5,
                          //   itemSize: 20.0,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                      try {
                        final res = await TutorApi.addTutorToFavorite(
                          token: AppState.token.access!.token!,
                          tutorId: widget.tutor.userId!,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(_isFavorite
                                ? "Added to favorite"
                                : "Removed from favorite"),
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
                          ),
                        );
                      }
                    },
                    icon: _isFavorite
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
              list: _str2list(widget.tutor.specialties as String),
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

  _str2list(String str) {
    return str.split(',').map((e) => e.trim()).toList();
  }

  List<Widget> _ratingBar(double rating) {
    List<Widget> rowList = List<Widget>.generate(
        rating.round(),
        (index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ));
    rowList.add(Text(rating.toStringAsFixed(1)));
    return rowList;
  }
}

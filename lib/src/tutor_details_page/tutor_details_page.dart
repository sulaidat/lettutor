import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/api/schedule_api.dart';
import 'package:lettutor/src/api/tutor_api.dart';
import 'package:lettutor/src/custom_widgets/pro_heading.dart';
import 'package:lettutor/src/custom_widgets/rating_bar.dart';
import 'package:lettutor/src/login_page/auth.dart';
import 'package:lettutor/src/mock_data.dart';
import 'package:lettutor/src/models/schedule/schedule.dart';
import 'package:lettutor/src/models/schedule_info.dart';
import 'package:lettutor/src/models/tutor/tutor.dart';
import 'package:lettutor/src/models/tutor/tutor_info.dart';
import 'package:lettutor/src/tutor_details_page/tutor_booking_sheet.dart';

import '../custom_widgets/pro_chips_from_string.dart';
import '../custom_widgets/pro_toggle_button.dart';
import '../helpers/padding.dart';
import 'tutor_card_minimal.dart';

class TutorDetailsPage extends StatefulWidget {
  const TutorDetailsPage({
    super.key,
    required this.tutorId,
    required this.tutor,
  });

  final String tutorId;
  final Tutor tutor;

  @override
  State<TutorDetailsPage> createState() => _TutorDetailsPageState();
}

class _TutorDetailsPageState extends State<TutorDetailsPage> {
  late TutorInfo _tutorInfo;
  List<Schedule> _schedules = [];
  bool _isLoading = true;

  _fetchTutorInfo() async {
    try {
      final res = await TutorApi.getTutorInfoById(
          token: AppState.token.access!.token!, tutorId: widget.tutorId);
      setState(() {
        _tutorInfo = res;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _getTutorInfo(widget.tutorId);
    // _getScheduleInfo(widget.tutorId);
  }

  _getTutorInfo(String userId) async {
    try {
      var tutorInfo = await TutorApi.getTutorInfoById(
          token: AppState.token.access!.token!, tutorId: userId);
      setState(() {
        _tutorInfo = tutorInfo;
        _isLoading = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }


  _changeFavorite(String userId) async {
    try {
      return await TutorApi.changeFavorite(
        token: AppState.token.access!.token!,
        tutorId: userId,
      );
    } catch (e) {
      print("[_changeFavorite] ${e.toString()}");
    }
  }

  _buildTutorCard(BuildContext context, Tutor tutor) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          children: [
            Container(
                width: 70,
                height: 70,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CachedNetworkImage(
                  imageUrl: "${tutor.avatar}",
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
                    "${tutor.name}",
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onBackground,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.flag),
                      Text("${tutor.country}"),
                    ],
                  ),
                  tutor.rating == null
                      ? Text("No rating")
                      : RatingBar(rating: tutor.rating!),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    tutor.isFavoriteTutor = !(tutor.isFavoriteTutor!);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        tutor.isFavoriteTutor!
                            ? "Added to favorite"
                            : "Removed from favorite",
                      ),
                      duration: Duration(seconds: 1),
                    ),
                  );
                  _changeFavorite(tutor.userId!).catchError((e) {
                    setState(() {
                      tutor.isFavoriteTutor = !(tutor.isFavoriteTutor!);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Error: ${e.toString()}",
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  });
                },
                icon: (tutor.isFavoriteTutor ?? false)
                    ? Icon(Icons.favorite, color: Colors.red)
                    : Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                      )),
            // ProFavToggleIcon(
            //   tutorId: tutor.id!,
            //   hook: (isToggled) async {},
            // )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                title: Text('Tutor Detail'),
                centerTitle: true,
              ),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Column(
                        children: [
                          Container(
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
                                _buildTutorCard(context, widget.tutor),
                                vpad(5),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${_tutorInfo.bio}",
                                    // maxLines: 4,
                                    overflow: TextOverflow.fade,
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                                vpad(5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        child: ProToggleButton(
                                          onPressed: () {
                                            context.push('/tutor/feedback',
                                                extra: widget.tutor.userId);
                                          },
                                          selectedIcon: Icons.star,
                                          unselectedIcon: Icons.star_border,
                                          isSelected: false,
                                          label: "Reviews",
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: VerticalDivider(),
                                    ),
                                    Expanded(
                                      child: ProToggleButton(
                                        onPressed: () async {
                                          final res = await showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  ReportDialog(
                                                    tutorId:
                                                        widget.tutor.userId!,
                                                  ));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(res.toString()),
                                              duration: Duration(seconds: 1),
                                            ),
                                          );
                                        },
                                        selectedIcon: Icons.report,
                                        unselectedIcon:
                                            Icons.report_gmailerrorred,
                                        isSelected: false,
                                        label: "Report",
                                        color: theme.colorScheme.error,
                                      ),
                                    ),
                                  ],
                                ),
                                vpad(5),
                                FilledButton(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        elevation: 5,
                                        clipBehavior: Clip.hardEdge,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                        ),
                                        builder: (context) => TutorBookingSheet(
                                            tutorId: widget.tutorId));
                                  },
                                  style: FilledButton.styleFrom(),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.edit_calendar),
                                      hpad(5),
                                      Text("Book now"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                vpad(5),
                                Heading1(text: "Education"),
                                Text("${_tutorInfo.education}"),
                                Heading1(text: "Languages"),
                                ProChipsFromList(
                                  list: str2list(_tutorInfo.languages!),
                                ),
                                Heading1(text: "Specialities"),
                                ProChipsFromList(
                                  list: str2list(_tutorInfo.specialties!),
                                ),
                                Heading1(text: "Introduction Video"),
                                // VideoApp(),
                                Heading1(text: "Suggested Courses"),
                                Row(
                                  children: [
                                    Text(
                                      "Course 1",
                                      style: theme.textTheme.titleSmall,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {}, child: Text("Go")),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Course 2",
                                      style: theme.textTheme.titleSmall,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {}, child: Text("Go")),
                                  ],
                                ),
                                Heading1(text: "Interests"),
                                Text("${_tutorInfo.interests}"),
                                Heading1(text: "Teaching Experience"),
                                Text("${_tutorInfo.experience}"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
              vpad(10),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportDialog extends StatefulWidget {
  const ReportDialog({
    super.key,
    required this.tutorId,
  });

  final String tutorId;

  @override
  State<ReportDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  final List<String> _options = [
    'Inappropriate behavior',
    'Inappropriate language',
    'Inappropriate profile picture',
    'Inappropriate video',
    'Inappropriate teaching method',
  ];

  String _otherOption = '';
  late List<bool> _selectedOptions;

  @override
  void initState() {
    super.initState();
    _selectedOptions = List<bool>.filled(_options.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text('Report'),
      children: <Widget>[
        for (int i = 0; i < _options.length; i++)
          CheckboxListTile(
            title: Text(_options[i]),
            value: _selectedOptions[i],
            onChanged: (bool? value) {
              setState(() {
                _selectedOptions[i] = value!;
              });
            },
          ),
        ListTile(
          title: TextField(
            onChanged: (value) {
              setState(() {
                _otherOption = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Other',
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String content = _selectedOptions
                    .asMap()
                    .entries
                    .where((element) => element.value)
                    .map((e) => e.key)
                    .map((e) => _options[e])
                    .toList()
                    .join(', ');
                if (_otherOption.isNotEmpty) {
                  content += ', $_otherOption';
                }
                TutorApi.reportTutor(
                  token: AppState.token.access!.token!,
                  tutorId: widget.tutorId,
                  content: content,
                ).then((value) {
                  Navigator.pop(context, value);
                });
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ],
    );
  }
}

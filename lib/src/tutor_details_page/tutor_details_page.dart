import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/api/tutor_api.dart';
import 'package:lettutor/src/custom_widgets/pro_heading.dart';
import 'package:lettutor/src/login_page/auth.dart';
import 'package:lettutor/src/models/tutor/tutor.dart';
import 'package:lettutor/src/models/tutor/tutor_info.dart';
import 'package:lettutor/src/models/tutor_list.dart';
import 'package:provider/provider.dart';

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
  // bool isFavorite = false;
  bool _shouldFetch = true;
  late TutorInfo _tutorInfo;

  _fetchTutorInfo() async {
    try {
      final res = await TutorApi.getTutorInfoById(
          token: AppState.token.access!.token!, tutorId: widget.tutorId);
      setState(() {
        _tutorInfo = res;
        // _isFavorite = _tutorInfo.isFavorite!;
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

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                title: Text('Tutor Detail'),
                centerTitle: true,
              ),
              _shouldFetch
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
                                TutorCardMinimal(
                                  tutorInfo: _tutorInfo,
                                ),
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
                                                extra: widget.tutor.feedbacks);
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
                                          // final tutorList = context.read<TutorList>();
                                          // showDialog(
                                          //   context: context,
                                          //   builder: (BuildContext context) {
                                          //     return ChangeNotifierProvider.value(
                                          //       value: tutorList,
                                          //       child: ReportDialog(
                                          //         options: violations,
                                          //         hook: (violations) {},
                                          //         tutorId: widget.tutor.userId!,
                                          //       ),
                                          //     );
                                          //   },
                                          // );
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
                                  onPressed: () {
                                    // showModalBottomSheet(
                                    //   context: context,
                                    //   builder: (context) {
                                    //     var scheduleInfo =
                                    //         context.watch<ScheduleInfo>();
                                    //     var lessons =
                                    //         scheduleInfo.getAvailableLessonsByTutorId(
                                    //             widget.tutor.userId!);
                                    //     if (lessons == null || lessons.isEmpty) {
                                    //       return Center(
                                    //           child: Text("No available lessons"));
                                    //     } else {
                                    //       return ListView.builder(
                                    //         itemCount: lessons.length,
                                    //         itemBuilder: (context, index) {
                                    //           final lesson = lessons[index];
                                    //           return ListTile(
                                    //             title: Text(DateFormat('yMd')
                                    //                 .format(lesson.date)),
                                    //             subtitle: Text(
                                    //                 'Start: ${lesson.start}, End: ${lesson.end}'),
                                    //             trailing: FilledButton(
                                    //               onPressed: () {
                                    //                 scheduleInfo
                                    //                     .bookLesson(lesson.id);
                                    //                 ScaffoldMessenger.of(context)
                                    //                     .showSnackBar(
                                    //                   SnackBar(
                                    //                     content: Text(
                                    //                         'Lesson booked successfully!'),
                                    //                   ),
                                    //                 );
                                    //               },
                                    //               child: Text("Book"),
                                    //             ),
                                    //           );
                                    //         },
                                    //       );
                                    //     }
                                    //   },
                                    // );
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
  late List<bool> _selectedOptions;
  final List<String> _options = [
    'Inappropriate behavior',
    'Inappropriate language',
    'Inappropriate profile picture',
    'Inappropriate video',
    'Inappropriate teaching method',
  ];
  String _otherOption = '';

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
                // var violations = _selectedOptions
                //     .asMap()
                //     .entries
                //     .where((element) => element.value)
                //     .map((e) => e.key)
                //     .map((e) => _options[e])
                //     .toList();
                // if (_otherOption.isNotEmpty) {
                //   violations.add(_otherOption);
                // }
                // context.read<TutorList>().reportTutor(
                //       widget.tutorId,
                //       violations,
                //     );
                // widget.hook(violations);
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

  _reportTutor({required Function(String) hook}) async {}
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/custom_widgets/pro_heading.dart';
import 'package:lettutor/src/mock_data.dart';
import 'package:lettutor/src/models/bonker.dart';
import 'package:lettutor/src/models/tutor.dart';
import 'package:lettutor/src/models/tutor_list.dart';
import 'package:lettutor/src/models/violation_report.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/pro_chips_from_string.dart';
import '../../custom_widgets/pro_heading1.dart';
import '../../custom_widgets/pro_toggle_button.dart';
import '../../helpers/padding.dart';
import 'tutor_card_minimal.dart';

class TutorDetailsPage extends StatefulWidget {
  const TutorDetailsPage({
    super.key,
    required this.tutor,
  });

  final Tutor tutor;

  @override
  State<TutorDetailsPage> createState() => _TutorDetailsPageState();
}

class _TutorDetailsPageState extends State<TutorDetailsPage> {
  bool isFavorite = false;

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
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                          TutorCardMinimal(tutor: widget.tutor),
                          vpad(5),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${widget.tutor.bio}",
                              maxLines: 4,
                              overflow: TextOverflow.fade,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                          vpad(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: ProToggleButton(
                                  onPressed: () {
                                    context.push(
                                        '/tutor/${widget.tutor.id}/review');
                                  },
                                  selectedIcon: Icons.star,
                                  unselectedIcon: Icons.star_border,
                                  isSelected: false,
                                  label: "Reviews",
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: VerticalDivider(),
                              ),
                              Expanded(
                                child: ProToggleButton(
                                  onPressed: () {
                                    final tutorList = context.read<TutorList>();
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ChangeNotifierProvider.value(
                                          value: tutorList,
                                          child: ReportDialog(
                                            options: violations,
                                            hook: (violations) {},
                                            tutorId: widget.tutor.id,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  selectedIcon: Icons.report,
                                  unselectedIcon: Icons.report_gmailerrorred,
                                  isSelected: false,
                                  label: "Report",
                                  color: theme.colorScheme.error,
                                ),
                              ),
                            ],
                          ),
                          vpad(5),
                          FilledButton(
                            onPressed: () {},
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
                          Text("${widget.tutor.education}"),
                          Heading1(text: "Languages"),
                          ProChipsFromList(
                            list: widget.tutor.languages!.toList(),
                          ),
                          Heading1(text: "Specialities"),
                          ProChipsFromList(
                            list: widget.tutor.specialties!.toList(),
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
                          Text("${widget.tutor.interests}"),
                          Heading1(text: "Teaching Experience"),
                          Text("${widget.tutor.teachingExperience}"),
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
    required this.options,
    required this.hook,
    required this.tutorId,
  });

  final String tutorId;
  final List<String> options;
  final ValueChanged<List<String>> hook;

  @override
  State<ReportDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  late List<bool> selectedOptions;
  String otherOption = '';

  @override
  void initState() {
    super.initState();
    selectedOptions = List<bool>.filled(widget.options.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text('Report'),
      children: <Widget>[
        for (int i = 0; i < widget.options.length; i++)
          CheckboxListTile(
            title: Text(widget.options[i]),
            value: selectedOptions[i],
            onChanged: (bool? value) {
              setState(() {
                selectedOptions[i] = value!;
              });
            },
          ),
        ListTile(
          title: TextField(
            onChanged: (value) {
              setState(() {
                otherOption = value;
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
                var violations = selectedOptions
                    .asMap()
                    .entries
                    .where((element) => element.value)
                    .map((e) => e.key)
                    .map((e) => widget.options[e])
                    .toList();
                if (otherOption.isNotEmpty) {
                  violations.add(otherOption);
                }
                context.read<TutorList>().reportTutor(
                      widget.tutorId,
                      violations,
                    );
                widget.hook(violations);
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ],
    );
  }
}

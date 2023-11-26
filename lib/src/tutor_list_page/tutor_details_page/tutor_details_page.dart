import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/custom_widgets/pro_heading.dart';
import 'package:lettutor/src/models/tutor.dart';
import 'package:lettutor/src/models/tutor_list.dart';
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
                                  onPressed: () {},
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

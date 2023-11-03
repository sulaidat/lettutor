import 'package:flutter/material.dart';
import 'package:lettutor/src/courses_page/course_details/topic_details/topic_details_page.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/models/course.dart';

import '../../custom_widgets/pro_heading1.dart';
import '../../custom_widgets/pro_label.dart';

class CourseDetailsPage extends StatelessWidget {
  const CourseDetailsPage({
    super.key,
    required this.course,
    required this.onTopicSelect,
  });

  final Course course;
  final VoidCallback onTopicSelect;

  Widget _buildTopicButton(
      BuildContext context, String title, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: BorderSide(
          color: Colors.grey.withAlpha(100),
        ),
      ),
      onPressed: onPressed,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title),
      ),
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
                title: Text("Course Details"),
                centerTitle: true,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: theme.colorScheme.background,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                              bottom: Radius.circular(30),
                            ),
                            child: Image.network(
                              "${course.bannerUrl}",
                              height: 265,
                              width: 1000,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${course.name}",
                                  style: theme.textTheme.titleLarge?.copyWith(),
                                ),
                                vpad(5),
                                Text("${course.brief}"),
                                vpad(5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: ProLabel(
                                          icon: Icons.signal_cellular_alt,
                                          label: "${course.level}"),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: VerticalDivider(),
                                    ),
                                    Expanded(
                                      child: ProLabel(
                                          icon: Icons.timer,
                                          label:
                                              "${course.topics.length} lessons"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProHeading1(text: "Overview"),
                    Row(
                      children: [
                        Icon(
                          Icons.help_outline,
                          color: Colors.redAccent,
                        ),
                        Text(
                          "Why take this course?",
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                    Text("Aliquid quam consequatur blanditiis dignissimos."),
                    Row(
                      children: [
                        Icon(
                          Icons.help_outline,
                          color: Colors.redAccent,
                        ),
                        Text(
                          "What will you be able to do?",
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                    Text("Aliquid quam consequatur blanditiis dignissimos."),
                    ProHeading1(text: "List Lessons"),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (2 / 1),
                        crossAxisSpacing: 7,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        return _buildTopicButton(
                          context,
                          "${index + 1}. ${course.topics[index].name}",
                          onTopicSelect,
                        );
                      },
                      itemCount: course.topics.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

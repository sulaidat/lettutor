import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/custom_widgets/pro_heading.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/models/course/course.dart';
import 'package:lettutor/src/routes.dart';

import '../../custom_widgets/pro_label.dart';

class CourseDetailsPage extends StatefulWidget {
  const CourseDetailsPage({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  List<Topics> _topics = [];

  @override
  void initState() {
    super.initState();
    _topics = widget.course.topics!;
    _topics.sort((a, b) => a.orderCourse!.compareTo(b.orderCourse!));
  }

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
                leading: BackButton(
                  onPressed: () {
                    context.go('/courses');
                  },
                ),
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
                            child: CachedNetworkImage(
                                imageUrl: widget.course.imageUrl!,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Icon(
                                      Icons.image,
                                      size: 48,
                                      color: Colors.grey,
                                    ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                      Icons.image_not_supported,
                                      size: 48,
                                      color: Colors.grey,
                                    )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.course.name}",
                                  style: theme.textTheme.titleLarge?.copyWith(),
                                ),
                                vpad(5),
                                Text("${widget.course.description}"),
                                vpad(5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: ProLabel(
                                          icon: Icons.signal_cellular_alt,
                                          label:
                                              "${courseLevels[widget.course.level]}"),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: VerticalDivider(),
                                    ),
                                    Expanded(
                                      child: ProLabel(
                                          icon: Icons.timer,
                                          label:
                                              "${widget.course.topics!.length} Lessons"),
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
                    Heading2(text: "Overview"),
                    Row(
                      children: [
                        Icon(
                          Icons.help_outline,
                          color: Colors.redAccent,
                        ),
                        Heading3(text: "Why take this course?"),
                      ],
                    ),
                    Text(widget.course.reason ?? ""),
                    Row(
                      children: [
                        Icon(
                          Icons.help_outline,
                          color: Colors.redAccent,
                        ),
                        Heading3(text: "What will you be able to do")
                      ],
                    ),
                    Text(widget.course.purpose ?? ""),
                    Heading2(text: "Experience Level"),
                    Row(
                      children: [
                        Icon(
                          Icons.people_outline,
                          color: Colors.blue,
                        ),
                        Heading3(text: "${courseLevels[widget.course.level]}")
                      ],
                    ),
                    Heading2(text: "Course Length"),
                    Row(
                      children: [
                        Icon(
                          Icons.book_outlined,
                          color: Colors.blue,
                        ),
                        Heading3(
                            text: "${widget.course.topics!.length} Lessons")
                      ],
                    ),
                    Heading2(text: "List Topics"),

                    ...List<Widget>.generate(
                      widget.course.topics?.length ?? 0,
                      (index) => TopicCard(
                        index: index,
                        topic: widget.course.topics![index],
                      ),
                    ),
                    // GridView.builder(
                    //   gridDelegate:
                    //       const SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 2,
                    //     childAspectRatio: (2 / 1),
                    //     crossAxisSpacing: 7,
                    //     mainAxisSpacing: 5,
                    //   ),
                    //   itemBuilder: (context, index) {
                    //     return _buildTopicButton(
                    //       context,
                    //       "${index + 1}. ${widget.course.topics[index].name}",
                    //       onTopicSelect,
                    //     );
                    //   },
                    //   itemCount: widget.course.topics.length,
                    //   shrinkWrap: true,
                    //   physics: NeverScrollableScrollPhysics(),
                    // )
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

class TopicCard extends StatelessWidget {
  const TopicCard({
    Key? key,
    required this.index,
    required this.topic,
  }) : super(key: key);

  final int index;
  final Topics topic;

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 1.5,
      // surfaceTintColor: Colors.white,
      child: ListTile(
        title: Text('${index + 1}. ${topic.name}'),
        onTap: () {
          context
              .pushNamed(routeName['/course/detail/topic']!, queryParameters: {
            'title': topic.name ?? 'null name',
            'url': topic.nameFile ?? 'null file',
          });
        },
      ),
    );
  }
}

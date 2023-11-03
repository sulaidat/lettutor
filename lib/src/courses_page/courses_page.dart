import 'package:flutter/material.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/models/course.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({
    super.key,
    required this.courses,
    required this.onDiscover,
  });

  final List<Course> courses;
  final VoidCallback onDiscover;

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  Widget _buildCourseCard(BuildContext context, Course course) {
    final theme = Theme.of(context);
    return Container(
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
          // Image.network("${course.bannerUrl}"),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${course.level} - ${course.topics.length} Topics",
                      style: theme.textTheme.bodySmall,
                    ),
                    FilledButton(
                      onPressed: widget.onDiscover,
                      // onPressed: () {
                      //   to(context, CourseDetailsPage(course: course));
                      // },
                      child: Row(
                        children: [
                          Icon(Icons.public),
                          Text("Discover"),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                title: Text('Courses'),
                centerTitle: true,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return _buildCourseCard(context, widget.courses[index]);
                      },
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => vpad(10),
                      itemCount: widget.courses.length,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourseShell extends StatefulWidget {
  const CourseShell({super.key, required this.child});

  final Widget child;

  @override
  State<CourseShell> createState() => _CourseShellState();
}

class _CourseShellState extends State<CourseShell> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index) {
              switch (index) {
                case 0:
                  context.go('/courses');
                  break;
                case 1:
                  context.go('/ebook');
                  break;
              }
            },
            tabs: [
              Tab(text: "Courses"),
              Tab(text: "E-Books"),
            ],
          ),
        ),
        body: widget.child,
      ),
    );
  }
}

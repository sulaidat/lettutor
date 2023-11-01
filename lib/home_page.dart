import 'package:flutter/material.dart';
import 'package:lettutor/models/lesson_info.dart';

import 'teacher_list_page/teacher_list_page.dart';
import 'schedule_page/schedule_page.dart';
import 'courses_page/courses_page.dart';
import 'models/tutor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  List<LessonInfo> lessonInfos = [
    LessonInfo(
        tutor:
            Tutor(name: "Nguyen Quang Tuyen", imageUrl: "assets/imgs/avt.jpg"),
        date: "Tue, 24 Oct, 23",
        start: "00:00",
        end: "00:30"),
    LessonInfo(
        tutor:
            Tutor(name: "Nguyen Quang Tuyen", imageUrl: "assets/imgs/avt.jpg"),
        date: "Tue, 24 Oct, 23",
        start: "00:00",
        end: "00:30"),
    LessonInfo(
        tutor:
            Tutor(name: "Nguyen Quang Tuyen", imageUrl: "assets/imgs/avt.jpg"),
        date: "Tue, 24 Oct, 23",
        start: "00:00",
        end: "00:30"),
    LessonInfo(
        tutor:
            Tutor(name: "Nguyen Quang Tuyen", imageUrl: "assets/imgs/avt.jpg"),
        date: "Tue, 24 Oct, 23",
        start: "00:00",
        end: "00:30"),
    LessonInfo(
        tutor:
            Tutor(name: "Nguyen Quang Tuyen", imageUrl: "assets/imgs/avt.jpg"),
        date: "Tue, 24 Oct, 23",
        start: "00:00",
        end: "00:30"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home page",
      theme: Theme.of(context),
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          selectedIndex: pageIndex,
          // indicatorColor: Colors.amber,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_today_outlined),
              label: "Schedule",
              selectedIcon: Icon(Icons.calendar_today),
            ),
            NavigationDestination(
              icon: Icon(Icons.book_outlined),
              label: "Courses",
              selectedIcon: Icon(Icons.book),
            ),
          ],
        ),
        body: [
          TeacherListPage(),
          SchedulePage(
            lessonInfos: lessonInfos,
          ),
          CoursesPage(),
        ][pageIndex],
      ),
    );
  }
}

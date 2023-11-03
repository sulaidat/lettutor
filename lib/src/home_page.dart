import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/models/course.dart';
import 'package:lettutor/src/models/lesson.dart';
import 'package:lettutor/src/models/topic.dart';

import 'tutor_list_page/tutor_list_page.dart';
import 'schedule_page/schedule_page.dart';
import 'courses_page/courses_page.dart';
import 'models/tutor.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.child,
    required this.selectedIndex,
  });

  final Widget child;
  final int selectedIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  List<Lesson> lessons = [
    Lesson(
        tutor:
            Tutor(name: "Nguyen Quang Tuyen", imageUrl: "assets/imgs/avt.jpg"),
        date: "Tue, 24 Oct, 23",
        start: "00:00",
        end: "00:30"),
    Lesson(
        tutor:
            Tutor(name: "Nguyen Quang Tuyen", imageUrl: "assets/imgs/avt.jpg"),
        date: "Tue, 24 Oct, 23",
        start: "00:00",
        end: "00:30"),
    Lesson(
        tutor:
            Tutor(name: "Nguyen Quang Tuyen", imageUrl: "assets/imgs/avt.jpg"),
        date: "Tue, 24 Oct, 23",
        start: "00:00",
        end: "00:30"),
    Lesson(
        tutor:
            Tutor(name: "Nguyen Quang Tuyen", imageUrl: "assets/imgs/avt.jpg"),
        date: "Tue, 24 Oct, 23",
        start: "00:00",
        end: "00:30"),
    Lesson(
        tutor:
            Tutor(name: "Nguyen Quang Tuyen", imageUrl: "assets/imgs/avt.jpg"),
        date: "Tue, 24 Oct, 23",
        start: "00:00",
        end: "00:30"),
  ];
  List<Course> courses = [
    Course(
        name: "Legacy Metrics Orchestrator",
        brief:
            "Nihil omnis delectus ad earum. Sit tenetur voluptas dolor quis sunt. Alias voluptate qui maiores aut sit ex non rerum ea. Et praesentium dolorum non totam quas.",
        bannerUrl:
            "https://fastly.picsum.photos/id/985/400/400.jpg?hmac=5SmuXWu91XF50ow5mHq-9UzJZBX_AjOPhO91xFeRnPQ",
        level: "Intermediate",
        topics: [
          Topic(name: "Food You Love"),
          Topic(name: "Your Job"),
          Topic(name: "Playing and Watching Sports"),
          Topic(name: "The Best Pet"),
          Topic(name: "Having Fun in your Free Time"),
          Topic(name: "Your Daily Routine"),
          Topic(name: "Childhood Memories"),
          Topic(name: "Your Family Members"),
          Topic(name: "Your Hometowns"),
          Topic(name: "Shopping Habits"),
        ]),
    Course(
        name: "Legacy Metrics Orchestrator",
        brief:
            "Nihil omnis delectus ad earum. Sit tenetur voluptas dolor quis sunt. Alias voluptate qui maiores aut sit ex non rerum ea. Et praesentium dolorum non totam quas.",
        bannerUrl:
            "https://fastly.picsum.photos/id/985/400/400.jpg?hmac=5SmuXWu91XF50ow5mHq-9UzJZBX_AjOPhO91xFeRnPQ",
        level: "Intermediate",
        topics: [
          Topic(name: "Food You Love"),
          Topic(name: "Your Job"),
          Topic(name: "Playing and Watching Sports"),
          Topic(name: "The Best Pet"),
          Topic(name: "Having Fun in your Free Time"),
          Topic(name: "Your Daily Routine"),
          Topic(name: "Childhood Memories"),
          Topic(name: "Your Family Members"),
          Topic(name: "Your Hometowns"),
          Topic(name: "Shopping Habits"),
        ]),
    Course(
        name: "Legacy Metrics Orchestrator",
        brief:
            "Nihil omnis delectus ad earum. Sit tenetur voluptas dolor quis sunt. Alias voluptate qui maiores aut sit ex non rerum ea. Et praesentium dolorum non totam quas.",
        bannerUrl:
            "https://fastly.picsum.photos/id/985/400/400.jpg?hmac=5SmuXWu91XF50ow5mHq-9UzJZBX_AjOPhO91xFeRnPQ",
        level: "Intermediate",
        topics: [
          Topic(name: "Food You Love"),
          Topic(name: "Your Job"),
          Topic(name: "Playing and Watching Sports"),
          Topic(name: "The Best Pet"),
          Topic(name: "Having Fun in your Free Time"),
          Topic(name: "Your Daily Routine"),
          Topic(name: "Childhood Memories"),
          Topic(name: "Your Family Members"),
          Topic(name: "Your Hometowns"),
          Topic(name: "Shopping Habits"),
        ]),
    Course(
        name: "Legacy Metrics Orchestrator",
        brief:
            "Nihil omnis delectus ad earum. Sit tenetur voluptas dolor quis sunt. Alias voluptate qui maiores aut sit ex non rerum ea. Et praesentium dolorum non totam quas.",
        bannerUrl:
            "https://fastly.picsum.photos/id/985/400/400.jpg?hmac=5SmuXWu91XF50ow5mHq-9UzJZBX_AjOPhO91xFeRnPQ",
        level: "Intermediate",
        topics: [
          Topic(name: "Food You Love"),
          Topic(name: "Your Job"),
          Topic(name: "Playing and Watching Sports"),
          Topic(name: "The Best Pet"),
          Topic(name: "Having Fun in your Free Time"),
          Topic(name: "Your Daily Routine"),
          Topic(name: "Childhood Memories"),
          Topic(name: "Your Family Members"),
          Topic(name: "Your Hometowns"),
          Topic(name: "Shopping Habits"),
        ]),
    Course(
        name: "Legacy Metrics Orchestrator",
        brief:
            "Nihil omnis delectus ad earum. Sit tenetur voluptas dolor quis sunt. Alias voluptate qui maiores aut sit ex non rerum ea. Et praesentium dolorum non totam quas.",
        bannerUrl:
            "https://fastly.picsum.photos/id/985/400/400.jpg?hmac=5SmuXWu91XF50ow5mHq-9UzJZBX_AjOPhO91xFeRnPQ",
        level: "Intermediate",
        topics: [
          Topic(name: "Food You Love"),
          Topic(name: "Your Job"),
          Topic(name: "Playing and Watching Sports"),
          Topic(name: "The Best Pet"),
          Topic(name: "Having Fun in your Free Time"),
          Topic(name: "Your Daily Routine"),
          Topic(name: "Childhood Memories"),
          Topic(name: "Your Family Members"),
          Topic(name: "Your Hometowns"),
          Topic(name: "Shopping Habits"),
        ]),
    Course(
        name: "Legacy Metrics Orchestrator",
        brief:
            "Nihil omnis delectus ad earum. Sit tenetur voluptas dolor quis sunt. Alias voluptate qui maiores aut sit ex non rerum ea. Et praesentium dolorum non totam quas.",
        bannerUrl:
            "https://fastly.picsum.photos/id/985/400/400.jpg?hmac=5SmuXWu91XF50ow5mHq-9UzJZBX_AjOPhO91xFeRnPQ",
        level: "Intermediate",
        topics: [
          Topic(name: "Food You Love"),
          Topic(name: "Your Job"),
          Topic(name: "Playing and Watching Sports"),
          Topic(name: "The Best Pet"),
          Topic(name: "Having Fun in your Free Time"),
          Topic(name: "Your Daily Routine"),
          Topic(name: "Childhood Memories"),
          Topic(name: "Your Family Members"),
          Topic(name: "Your Hometowns"),
          Topic(name: "Shopping Habits"),
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);

    return MaterialApp(
      title: "Home page",
      theme: Theme.of(context),
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (idx) {
            if (idx == 0) router.go('/list/list');
            if (idx == 1) router.go('/schedule');
            if (idx == 2) router.go('/courses');
          },
          selectedIndex: widget.selectedIndex,
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
        body: widget.child,
        // body: [
        //   TutorListPage(),
        //   SchedulePage(
        //     lessonInfos: lessons,
        //   ),
        //   CoursesPage(
        //     courses: courses,
        //   ),
        // ][pageIndex],
      ),
    );
  }
}

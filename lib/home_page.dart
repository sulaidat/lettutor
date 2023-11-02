import 'package:flutter/material.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/models/lesson.dart';
import 'package:lettutor/models/topic.dart';

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
            lessonInfos: lessons,
          ),
          CoursesPage(
            courses: courses,
          ),
        ][pageIndex],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/courses_page/courses_page.dart';
import 'package:lettutor/src/home_page.dart';
import 'package:lettutor/src/models/course.dart';
import 'package:lettutor/src/models/lesson.dart';
import 'package:lettutor/src/models/topic.dart';
import 'package:lettutor/src/models/tutor.dart';
import 'package:lettutor/src/schedule_page/schedule_page.dart';
import 'package:lettutor/src/theme/color_schemes.g.dart';
import 'package:lettutor/src/tutor_list_page/tutor_list_page.dart';

List<Lesson> lessons = [
  Lesson(
      tutor: Tutor(name: "Nguyen Quang Tuyen", imageUrl: "assets/imgs/avt.jpg"),
      date: "Tue, 24 Oct, 23",
      start: "00:00",
      end: "00:30"),
  Lesson(
      tutor: Tutor(name: "Nguyen Quang Tuyen", imageUrl: "assets/imgs/avt.jpg"),
      date: "Tue, 24 Oct, 23",
      start: "00:00",
      end: "00:30"),
  Lesson(
      tutor: Tutor(name: "Nguyen Quang Tuyen", imageUrl: "assets/imgs/avt.jpg"),
      date: "Tue, 24 Oct, 23",
      start: "00:00",
      end: "00:30"),
  Lesson(
      tutor: Tutor(name: "Nguyen Quang Tuyen", imageUrl: "assets/imgs/avt.jpg"),
      date: "Tue, 24 Oct, 23",
      start: "00:00",
      end: "00:30"),
  Lesson(
      tutor: Tutor(name: "Nguyen Quang Tuyen", imageUrl: "assets/imgs/avt.jpg"),
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      routerConfig: GoRouter(
        debugLogDiagnostics: true,
        initialLocation: '/list/list',
        routes: [
          ShellRoute(
            builder: (context, state, child) {
              return HomePage(
                selectedIndex: switch (state.uri.path) {
                  var p when p.startsWith('/list') => 0,
                  var p when p.startsWith('/schedule') => 1,
                  var p when p.startsWith('/courses') => 2,
                  _ => 0,
                },
                child: child,
              );
            },
            routes: [
              GoRoute(
                path: '/list/list',
                builder: (context, state) {
                  return TutorListPage();
                },
              ),
              GoRoute(
                path: '/schedule',
                builder: (context, state) {
                  return SchedulePage(lessonInfos: lessons);
                },
              ),
              GoRoute(
                path: '/courses',
                builder: (context, state) {
                  return CoursesPage(courses: courses);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/courses_page/course_details/course_details_page.dart';
import 'package:lettutor/src/courses_page/course_details/topic_details/topic_details_page.dart';
import 'package:lettutor/src/courses_page/courses_page.dart';
import 'package:lettutor/src/login_page/forgot_password_page.dart';
import 'package:lettutor/src/login_page/register_page.dart';
import 'package:lettutor/src/login_page/reset_password_page.dart';
import 'package:lettutor/src/mock_data.dart';
import 'package:lettutor/src/models/schedule_info.dart';
import 'package:lettutor/src/models/search_filter.dart';
import 'package:lettutor/src/models/tutor_info.dart';
import 'package:lettutor/src/models/tutor_list.dart';
import 'package:lettutor/src/routes.dart';
import 'package:lettutor/src/shell.dart';
import 'package:lettutor/src/login_page/login_page.dart';
import 'package:lettutor/src/login_page/meeting_room/meeting_room.dart';
import 'package:lettutor/src/login_page/meeting_room/waiting_room.dart';
import 'package:lettutor/src/models/course.dart';
import 'package:lettutor/src/models/topic.dart';
import 'package:lettutor/src/schedule_page/history_page/history_page.dart';
import 'package:lettutor/src/schedule_page/schedule_page.dart';
import 'package:lettutor/src/theme/color_schemes.g.dart';
import 'package:lettutor/src/tutor_list_page/tutor_details_page/reviews_page/reviews_page.dart';
import 'package:lettutor/src/tutor_list_page/tutor_details_page/tutor_details_page.dart';
import 'package:lettutor/src/tutor_list_page/tutor_list_page.dart';
import 'package:provider/provider.dart';

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

class AppRoutes {
  static const tutorList = '/list';
  static const tutorDetails = '/list/:tutorId';
  static const tutorReviews = '/list/:tutorId/reviews';
  static const meetWait = '/meet/wait';
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TutorList tutorList = TutorList();
  TutorInfo tutorInfo = TutorInfo();
  ScheduleInfo scheduleInfo = ScheduleInfo();

  void initData() {
    // asign 2 available lessons to each tutor
    for (var i = 0; i < lessons.length; i++) {
      lessons[i].tutor = tutors[i % tutors.length];
    }

    scheduleInfo.availableLessons = lessons;
    scheduleInfo.bookedLessons = [];
    scheduleInfo.completedLessons = [];

    // book some lessons for testing
    scheduleInfo.bookLesson('1');
    scheduleInfo.bookLesson('3');
    scheduleInfo.bookLesson('5');
    scheduleInfo.bookLesson('7');
    scheduleInfo.bookLesson('9');

    // complete some lessons for testing
    scheduleInfo.completeLesson('7');
    scheduleInfo.completeLesson('9');

    tutorList.tutors = tutors;
    tutorList.displayedTutors = tutors;

    tutorInfo.availNationalities = tutorList.getNationalities();
    tutorInfo.availSpecialities = tutorList.getSpecialties();
  }

  @override
  Widget build(BuildContext context) {
    initData();

    return MaterialApp.router(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      routerConfig: GoRouter(
        debugLogDiagnostics: true,
        initialLocation: '/tutor/all',
        // TODO : IMPORTANT Remember to uncomment this
        // redirect: (context, state) {
        //   var auth = AuthService();
        //   var path = state.uri.path;
        //   print('Current path: $path');
        //   if (auth.isLoggedIn) {
        //     return null;
        //   } else if (path.contains('login') ||
        //       path.contains('register') ||
        //       path.contains('forgot_password') ||
        //       path.contains('reset_password')) {
        //     return path;
        //   }
        //   return '/login';
        // },
        routes: [
          GoRoute(
            name: routeName['/login'],
            path: '/login',
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            name: routeName['/register'],
            path: '/register',
            builder: (context, state) => const RegisterPage(),
          ),
          GoRoute(
            name: routeName['/forgot_password'],
            path: '/forgot_password',
            builder: (context, state) => const ForgotPasswordPage(),
          ),
          GoRoute(
            name: routeName['/reset_password'],
            path: '/reset_password',
            builder: (context, state) => const ResetPasswordPage(),
          ),
          ShellRoute(
            builder: (context, state, child) {
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider.value(value: tutorList),
                  ChangeNotifierProvider.value(value: scheduleInfo)
                ],
                child: Shell(
                  selectedIndex: switch (state.uri.path) {
                    var p when p.startsWith('/list') => 0,
                    var p when p.startsWith('/schedule') => 1,
                    var p when p.startsWith('/courses') => 2,
                    _ => 0,
                  },
                  child: child,
                ),
              );
            },
            routes: [
              GoRoute(
                name: routeName['/tutor/all'],
                path: '/tutor/all',
                builder: (context, state) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider.value(value: tutorInfo),
                    ChangeNotifierProvider(create: (_) => SearchFilter())
                  ],
                  child: const TutorListPage(),
                ),
              ),
              GoRoute(
                name: 'tutor',
                path: '/tutor/:tutorId',
                builder: (context, state) {
                  String id = state.pathParameters['tutorId'] ?? '';
                  if (id == '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Tutor not found')),
                    );
                    context.pop(); // is this right?
                  }
                  return TutorDetailsPage(tutor: tutorList.getTutorById(id));
                },
              ),
              GoRoute(
                name: 'review',
                path: '/tutor/:tutorId/review',
                builder: (context, state) {
                  String id = state.pathParameters['tutorId'] ?? '';
                  if (id == '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Something went wrong')),
                    );
                    context.pop(); // is this right?
                  }
                  return ReviewsPage(
                    tutorId: id,
                  );
                },
              ),
              GoRoute(
                name: routeName['/schedule'],
                path: '/schedule',
                builder: (context, state) => SchedulePage(),
              ),
              GoRoute(
                name: 'history',
                path: '/schedule/history',
                builder: (context, state) {
                  return HistoryPage(history: lessons);
                },
              ),
              GoRoute(
                name: 'courses',
                path: '/courses',
                builder: (context, state) {
                  return CoursesPage(
                    courses: courses,
                    onDiscover: () {
                      // TODO
                      GoRouter.of(context).push('/courses/0');
                    },
                  );
                },
              ),
              GoRoute(
                name: 'course detail',
                path: '/courses/:id',
                builder: (context, state) {
                  int idx = int.parse(state.pathParameters['id'] ?? '0');
                  return CourseDetailsPage(
                    course: courses[idx],
                    onTopicSelect: () {
                      // TODO
                      GoRouter.of(context).push('/courses/$idx/0');
                    },
                  );
                },
              ),
              GoRoute(
                path: '/courses/:courseId/:topicId',
                builder: (context, state) {
                  // TODO
                  int courseId =
                      int.parse(state.pathParameters['courseId'] ?? '0');
                  int topicId =
                      int.parse(state.pathParameters['topicId'] ?? '0');
                  return TopicDetailsPage(
                    topic: courses[courseId].topics[topicId],
                  );
                },
              )
            ],
          ),
          GoRoute(
            name: 'wating room',
            path: '/meet/wait',
            builder: (context, state) {
              return WaitingRoom(onJoin: () {
                GoRouter.of(context).push('/meet');
              });
            },
          ),
          GoRoute(
            name: 'meeting room',
            path: '/meet',
            builder: (context, state) {
              return MeetingRoom(
                onLeave: () {
                  GoRouter.of(context)
                    ..pop()
                    ..pop();
                },
              );
            },
          )
        ],
      ),
    );
  }
}

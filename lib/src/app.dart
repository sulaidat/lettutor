import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/courses_page/course_details/course_details_page.dart';
import 'package:lettutor/src/courses_page/course_details/topic_details/topic_details_page.dart';
import 'package:lettutor/src/courses_page/course_shell.dart';
import 'package:lettutor/src/courses_page/courses_page.dart';
import 'package:lettutor/src/courses_page/ebook_page/ebook_page.dart';
import 'package:lettutor/src/pages/login_page/auth.dart';
import 'package:lettutor/src/pages/login_page/forgot_password_page.dart';
import 'package:lettutor/src/pages/login_page/register_page.dart';
import 'package:lettutor/src/pages/login_page/reset_password_page.dart';
import 'package:lettutor/src/pages/login_page/verify_page.dart';
import 'package:lettutor/src/mock_data.dart';
import 'package:lettutor/src/models/schedule_info.dart';
import 'package:lettutor/src/models/search_filter.dart';
import 'package:lettutor/src/models/tutor/tutor.dart';
import 'package:lettutor/src/models/tutor/tutor_feedback.dart';
import 'package:lettutor/src/models/tutor/tutor_info.dart';
import 'package:lettutor/src/models/tutor_list.dart';
import 'package:lettutor/src/routes.dart';
import 'package:lettutor/src/pages/setting_page/setting_page.dart';
import 'package:lettutor/src/shell.dart';
import 'package:lettutor/src/pages/login_page/login_page.dart';
import 'package:lettutor/src/pages/login_page/meeting_room/meeting_room.dart';
import 'package:lettutor/src/pages/login_page/meeting_room/waiting_room.dart';
import 'package:lettutor/src/models/course.dart';
import 'package:lettutor/src/models/topic.dart';
import 'package:lettutor/src/pages/schedule_page/history_page/history_page.dart';
import 'package:lettutor/src/pages/schedule_page/schedule_page.dart';
import 'package:lettutor/src/theme/color_schemes.g.dart';
import 'package:lettutor/src/pages/tutor_list_page/tutor_details_page/feedback_page/feedback_page.dart';
import 'package:lettutor/src/pages/tutor_list_page/tutor_details_page/tutor_details_page.dart';
import 'package:lettutor/src/pages/tutor_list_page/tutor_list_page.dart';
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

  // static late SharedPreferences prefs;
  // static late final String accessToken;

  // Future<SharedPreferences> getShare() async {
  //   return SharedPreferences.getInstance();
  // }

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

    // tutorInfo.availNationalities = tutorList.getNationalities();
    // tutorInfo.availSpecialities = tutorList.getSpecialties();
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
        redirect: (context, state) {
          var path = state.uri.path;
          print('Current path: $path');
          if (AppState.isLoggedIn) {
            return null;
          } else if (path.contains('login') ||
              path.contains('register') ||
              path.contains('forgot_password') ||
              path.contains('reset_password') ||
              path.contains('verify_account')) {
            return path;
          }
          return '/login';
        },
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
            name: routeName['/verify_account'],
            path: '/verify_account',
            builder: (context, state) {
              String email = state.extra! as String;
              return VerifyPage(email: email);
            },
          ),
          GoRoute(
            name: routeName['/forgot_password'],
            path: '/forgot_password',
            builder: (context, state) => ForgotPasswordPage(),
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
                child: AppShell(
                  selectedIndex: switch (state.uri.path) {
                    var p when p.startsWith('/list') => 0,
                    var p when p.startsWith('/schedule') => 1,
                    var p when p.startsWith('/courses') => 2,
                    var p when p.startsWith('/settings') => 3,
                    _ => 0,
                  },
                  child: child,
                ),
              );
            },
            routes: [
              GoRoute(
                name: routeName['/settings'],
                path: '/settings',
                builder: (context, state) => SettingsPage(),
              ),
              GoRoute(
                name: routeName['/tutor/all'],
                path: '/tutor/all',
                builder: (context, state) => MultiProvider(
                  providers: [
                    // ChangeNotifierProvider.value(value: tutorInfo),
                    ChangeNotifierProvider(create: (_) => SearchFilter())
                  ],
                  child: const TutorListPage(),
                ),
              ),
              GoRoute(
                  name: routeName['/tutor/detail'],
                  path: '/tutor/detail',
                  builder: (context, state) => TutorDetailsPage(
                        tutorId: state.uri.queryParameters['tutorId']!,
                        tutor: state.extra as Tutor,
                      )),
              GoRoute(
                name: routeName['/tutor/feedback'],
                path: '/tutor/feedback',
                builder: (context, state) =>
                    FeedbackPage(userId: state.extra as String),
              ),
              GoRoute(
                name: routeName['/schedule'],
                path: '/schedule',
                builder: (context, state) => SchedulePage(),
              ),
              GoRoute(
                name: routeName['/schedule/history'],
                path: '/schedule/history',
                builder: (context, state) => HistoryPage(),
              ),
              ShellRoute(
                builder: (context, state, child) => CourseShell(child: child),
                routes: [
                  GoRoute(
                    name: routeName['/courses'],
                    path: '/courses',
                    builder: (context, state) => CoursesPage(
                      courses: courses,
                      onDiscover: () {},
                    ),
                  ),
                  GoRoute(
                    name: routeName['/ebook'],
                    path: '/ebook',
                    builder: (context, state) => EbookPage(),
                    // builder: (context, state) => Placeholder(),
                  )
                ],
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

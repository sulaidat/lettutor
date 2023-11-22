import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/login_page/auth.dart';
import 'package:lettutor/src/courses_page/course_details/course_details_page.dart';
import 'package:lettutor/src/courses_page/course_details/topic_details/topic_details_page.dart';
import 'package:lettutor/src/courses_page/courses_page.dart';
import 'package:lettutor/src/login_page/register_page.dart';
import 'package:lettutor/src/routes.dart';
import 'package:lettutor/src/shell.dart';
import 'package:lettutor/src/login_page/login_page.dart';
import 'package:lettutor/src/meeting_room/meeting_room.dart';
import 'package:lettutor/src/meeting_room/waiting_room.dart';
import 'package:lettutor/src/models/course.dart';
import 'package:lettutor/src/models/lesson.dart';
import 'package:lettutor/src/models/topic.dart';
import 'package:lettutor/src/models/tutor.dart';
import 'package:lettutor/src/schedule_page/history_page/history_page.dart';
import 'package:lettutor/src/schedule_page/schedule_page.dart';
import 'package:lettutor/src/theme/color_schemes.g.dart';
import 'package:lettutor/src/tutor_list_page/tutor_details_page/reviews_page/reviews_page.dart';
import 'package:lettutor/src/tutor_list_page/tutor_details_page/tutor_details_page.dart';
import 'package:lettutor/src/tutor_list_page/tutor_list_page.dart';
import 'package:provider/provider.dart';

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
List<Tutor> tutors = [
  Tutor(
      imageUrl: "assets/imgs/avt.jpg",
      name: "Hanna Graham",
      bio:
          "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
  Tutor(
      imageUrl: "assets/imgs/avt.jpg",
      name: "Gretchen Orn",
      bio:
          "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
  Tutor(
      imageUrl: "assets/imgs/avt.jpg",
      name: "Marvin McClure",
      bio:
          "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
  Tutor(
      imageUrl: "assets/imgs/avt.jpg",
      name: "Demarco Purdy",
      bio:
          "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
  Tutor(
      imageUrl: "assets/imgs/avt.jpg",
      name: "Paris Bernier",
      bio:
          "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
  Tutor(
      imageUrl: "assets/imgs/avt.jpg",
      name: "Katelin Tromp",
      bio:
          "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
  Tutor(
      imageUrl: "assets/imgs/avt.jpg",
      name: "Linnie Stehr",
      bio:
          "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
  Tutor(
      imageUrl: "assets/imgs/avt.jpg",
      name: "Abdullah Hills",
      bio:
          "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
  Tutor(
      imageUrl: "assets/imgs/avt.jpg",
      name: "Torey Watsica",
      bio:
          "Aliquid beatae esse dolorem corporis ex. Et quidem qui nam numquam doloremque. Quaerat molestias repellat aut sint."),
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      routerConfig: GoRouter(
        debugLogDiagnostics: true,
        initialLocation: '/list/all',
        redirect: (context, state) {
          var auth = AuthService();
          var path = state.uri.path;
          print(path);
          if (auth.isLoggedIn) {
            return null;
          } else if (path.contains('/login') ||
              path.contains('/register') ||
              path.contains('/forgot_password')) {
            return path;
          }
          return '/login';
        },
        routes: [
          GoRoute(
            name: routeName['/login'],
            path: '/login',
            builder: (context, state) {
              return LoginPage(
                onLogIn: (username, password) {
                  // var auth = Provider.of<AuthService>(context, listen: false);
                  var auth = context.read<AuthService>();
                  print("pressed");
                  auth.logIn(username, password);
                  context.go('/list/all');
                },
              );
            },
          ),
          GoRoute(
            name: routeName['/register'],
            path: '/register',
            builder: (context, state) => const RegisterPage(),
          ),
          ShellRoute(
            builder: (context, state, child) {
              return Shell(
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
                name: 'list all',
                path: '/list/all',
                builder: (context, state) {
                  return TutorListPage(
                    onItemSelect: () {
                      // TODO
                      GoRouter.of(context).push('/list/0');
                    },
                    onJoinMeeting: () {
                      // TODO
                      print("what's wrong?");
                      GoRouter.of(context).push('/meet/wait');
                    },
                  );
                },
              ),
              GoRoute(
                name: 'tutor details',
                path: '/list/:tutorId',
                builder: (context, state) {
                  int id = int.parse(state.pathParameters['tutorId'] ?? '0');
                  return TutorDetailsPage(
                    tutor: tutors[id],
                    onReviews: () {
                      // TODO
                      GoRouter.of(context).push('/list/$id/reviews');
                    },
                  );
                },
              ),
              GoRoute(
                name: 'reviews',
                path: '/list/:tutorId/reviews',
                builder: (context, state) {
                  return ReviewsPage();
                },
              ),
              GoRoute(
                name: 'schedule',
                path: '/schedule',
                builder: (context, state) {
                  return SchedulePage(
                    lessonInfos: lessons,
                    onHistory: () {
                      GoRouter.of(context).push("/schedule/history");
                    },
                    onJoin: () {
                      GoRouter.of(context).push('/meet/wait');
                    },
                  );
                },
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

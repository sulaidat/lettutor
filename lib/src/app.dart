import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/courses_page/course_details/course_details_page.dart';
import 'package:lettutor/src/courses_page/course_details/topic_details/topic_details_page.dart';
import 'package:lettutor/src/courses_page/course_shell.dart';
import 'package:lettutor/src/courses_page/courses_page.dart';
import 'package:lettutor/src/courses_page/ebook_page/ebook_page.dart';
import 'package:lettutor/src/models/course/course.dart';
import 'package:lettutor/src/pages/login_page/auth.dart';
import 'package:lettutor/src/pages/login_page/forgot_password_page.dart';
import 'package:lettutor/src/pages/login_page/register_page.dart';
import 'package:lettutor/src/pages/login_page/reset_password_page.dart';
import 'package:lettutor/src/pages/login_page/verify_page.dart';
import 'package:lettutor/src/models/tutor/tutor.dart';
import 'package:lettutor/src/models/tutor/tutor_info.dart';
import 'package:lettutor/src/pages/setting_page/become_tutor_page/become_tutor_page.dart';
import 'package:lettutor/src/pages/setting_page/update_profile_page/update_profile_page.dart';
import 'package:lettutor/src/routes.dart';
import 'package:lettutor/src/pages/setting_page/setting_page.dart';
import 'package:lettutor/src/shell.dart';
import 'package:lettutor/src/pages/login_page/login_page.dart';
import 'package:lettutor/src/pages/schedule_page/history_page/history_page.dart';
import 'package:lettutor/src/pages/schedule_page/schedule_page.dart';
import 'package:lettutor/src/theme/color_schemes.g.dart';
import 'package:lettutor/src/pages/tutor_list_page/tutor_details_page/feedback_page/feedback_page.dart';
import 'package:lettutor/src/pages/tutor_list_page/tutor_details_page/tutor_details_page.dart';
import 'package:lettutor/src/pages/tutor_list_page/tutor_list_page.dart';

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
  TutorInfo tutorInfo = TutorInfo();

  @override
  Widget build(BuildContext context) {
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
              return AppShell(
                selectedIndex: switch (state.uri.path) {
                  var p when p.startsWith('/list') => 0,
                  var p when p.startsWith('/schedule') => 1,
                  var p when p.startsWith('/course') => 2,
                  var p when p.startsWith('/setting') => 3,
                  _ => 0,
                },
                child: child,
              );
            },
            routes: [
              GoRoute(
                name: routeName['/tutor/all'],
                path: '/tutor/all',
                builder: (context, state) => const TutorListPage(),
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
                    builder: (context, state) => CoursesPage(),
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
                name: routeName['/course/detail'],
                path: '/course/detail',
                builder: (context, state) {
                  final course = state.extra as Course;
                  return CourseDetailsPage(course: course);
                },
              ),
              GoRoute(
                name: routeName['/course/detail/topic'],
                path: '/course/detail/topic',
                builder: (context, state) {
                  return TopicDetailPage(
                    title: state.uri.queryParameters['title']!,
                    url: state.uri.queryParameters['url']!,
                  );
                },
              ),
              GoRoute(
                name: routeName['/settings'],
                path: '/settings',
                builder: (context, state) => SettingsPage(),
              ),
              GoRoute(
                name: routeName['/setting/profile'],
                path: '/setting/profile',
                builder: (context, state) => UpdateProfilePage(),
              ),
              GoRoute(
                name: routeName['/setting/become_tutor'],
                path: '/setting/become_tutor',
                builder: (context, state) => BecomeTutorPage(),
              ),
              // GoRoute(
              //   path: '/courses/:courseId/:topicId',
              //   builder: (context, state) {
              //     // TODO
              //     int courseId =
              //         int.parse(state.pathParameters['courseId'] ?? '0');
              //     int topicId =
              //         int.parse(state.pathParameters['topicId'] ?? '0');
              //     return TopicDetailsPage(
              //       topic: courses[courseId].topics[topicId],
              //     );
              //   },
              // )
            ],
          ),
          // GoRoute(
          //   name: 'wating room',
          //   path: '/meet/wait',
          //   builder: (context, state) {
          //     return WaitingRoom(onJoin: () {
          //       GoRouter.of(context).push('/meet');
          //     });
          //   },
          // ),
          // GoRoute(
          //   name: 'meeting room',
          //   path: '/meet',
          //   builder: (context, state) {
          //     return MeetingRoom(
          //       onLeave: () {
          //         GoRouter.of(context)
          //           ..pop()
          //           ..pop();
          //       },
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}

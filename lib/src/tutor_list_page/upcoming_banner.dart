import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/src/api/user_api.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/login_page/auth.dart';
import 'package:lettutor/src/models/lesson.dart';
import 'package:lettutor/src/models/schedule/booking_info.dart';
import 'package:lettutor/src/tutor_list_page/countdown.dart';

class UpcomingBanner extends StatefulWidget {
  const UpcomingBanner({super.key});

  @override
  State<UpcomingBanner> createState() => _UpcomingBannerState();
}

class _UpcomingBannerState extends State<UpcomingBanner> {
  late Duration _totalLessonTime;
  late BookingInfo _upcomingClass;
  bool _isLoading = true;
  bool _isError = false;
  late String _msg;

  _fetchTotalLessonTime(String token) async {
    try {
      final total = await UserApi.getTotalLessonTime(token: token);
      final upcoming = await UserApi.getUpcomingLesson(token: token);

      if (mounted) {
        setState(() {
          _totalLessonTime = Duration(minutes: total);
          _upcomingClass = upcoming;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _msg = e.toString().substring(11);
        _isError = true;
      });
    }
  }

  _totalLessonTimeToString() {
    if (_totalLessonTime.inMinutes == 0) {
      return 'You have not attended any class';
    }
    String res = 'Total leson time:';
    final int hour = _totalLessonTime.inHours;
    final int minute = _totalLessonTime.inMinutes - hour * 60;
    res += hour > 0 ? ' $hour ${hour > 1 ? 'hours' : 'hour'}' : '';
    res += minute > 0 ? ' $minute ${minute > 1 ? 'minutes' : 'minute'}' : '';

    return res;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (_isLoading) {
      final accessToken = AppState.token.access!.token;
      _fetchTotalLessonTime(accessToken as String);
    }

    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.grey,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: theme.colorScheme.primary,
      ),
      child: _isLoading
          ? Center(
              child: _isError
                  ? Text(
                      _msg,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: theme.colorScheme.onPrimary),
                    )
                  : const CircularProgressIndicator(
                      color: Colors.white,
                    ),
            )
          : Column(
              children: [
                Text(
                  "Upcoming Lesson",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                vpad(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${DateFormat.yMMMEd().format(DateTime.fromMillisecondsSinceEpoch(_upcomingClass.scheduleDetailInfo!.startPeriodTimestamp ?? 0))} "
                          "${DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(_upcomingClass.scheduleDetailInfo!.startPeriodTimestamp ?? 0))} - "
                          "${DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(_upcomingClass.scheduleDetailInfo!.endPeriodTimestamp ?? 0))}",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        LessonCountdown(
                            upcomingLessonTime:
                                DateTime.fromMillisecondsSinceEpoch(
                                    _upcomingClass.scheduleDetailInfo!
                                        .startPeriodTimestamp!)),
                      ],
                    ),
                    hpad(10),
                    FilledButton(
                      style: FilledButton.styleFrom(
                          // padding: ,
                          backgroundColor: theme.colorScheme.onPrimary,
                          foregroundColor: theme.colorScheme.primary,
                          textStyle: theme.textTheme.titleMedium),
                      onPressed: () {},
                      child: Text("Join now"),
                    ),
                  ],
                ),
                vpad(5),
                Text(
                  _totalLessonTimeToString(),
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
    );
  }
}

int calculateTotalLessonTime(List<Lesson> completedLessons) {
  int totalDuration = 0;

  for (var lesson in completedLessons) {
    totalDuration += lesson.duration!;
  }

  return totalDuration;
}

String formatDuration(int totalMinutes) {
  int hours = totalMinutes ~/ 60;
  int minutes = totalMinutes % 60;
  return '$hours hours $minutes minutes';
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/models/lesson.dart';
import 'package:lettutor/src/models/schedule_info.dart';
import 'package:lettutor/src/tutor_list_page/countdown.dart';
import 'package:provider/provider.dart';

class UpcomingBanner extends StatefulWidget {
  const UpcomingBanner({
    super.key,
    required this.onJoin,
  });

  final VoidCallback onJoin;

  @override
  State<UpcomingBanner> createState() => _UpcomingBannerState();
}

class _UpcomingBannerState extends State<UpcomingBanner> {
  @override
  Widget build(BuildContext context) {
    final scheduleInfo = context.read<ScheduleInfo>();
    final theme = Theme.of(context);
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
      child: Column(
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
                    "${DateFormat('MEd').format(scheduleInfo.bookedLessons![0].date)} ${scheduleInfo.bookedLessons![0].start} - ${scheduleInfo.bookedLessons![0].end}",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // Text(
                  //   "Start in 1:00:00",
                  //   style: theme.textTheme.bodyMedium?.copyWith(
                  //     color: Colors.amberAccent,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  LessonCountdown(
                      upcomingLessonTime: scheduleInfo.bookedLessons![0].date),
                ],
              ),
              hpad(10),
              FilledButton(
                style: FilledButton.styleFrom(
                    // padding: ,
                    backgroundColor: theme.colorScheme.onPrimary,
                    foregroundColor: theme.colorScheme.primary,
                    textStyle: theme.textTheme.titleMedium),
                onPressed: widget.onJoin,
                child: Text("Join now"),
              ),
            ],
          ),
          vpad(5),
          Text(
            "Total lesson time: ${formatDuration(calculateTotalLessonTime(scheduleInfo.completedLessons!))}",
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/models/lesson.dart';
import 'package:lettutor/src/models/schedule_info.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/pro_fav_toggle_icon.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({
    super.key,
  });

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  Widget _buildLessonCard(BuildContext context, Lesson info) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: theme.colorScheme.background,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('yMd').format(info.date),
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${info.start} - ${info.end}",
            style: theme.textTheme.titleSmall,
          ),
          Divider(),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Image.network(
                  "${info.tutor!.imageUrl}",
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              hpad(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${info.tutor!.name}",
                      style: theme.textTheme.titleMedium,
                    ),
                    Row(
                      children: [Icon(Icons.flag), hpad(5), Text("Vietnam")],
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.all(0),
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4)),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.message),
                          Text("Direct message"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ProFavToggleIcon(tutorId: info.tutor!.id, hook: (isToggled) {}),
            ],
          ),
          vpad(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {
                  context.read<ScheduleInfo>().cancelLesson(info.id);
                },
                style: OutlinedButton.styleFrom(),
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              FilledButton(
                onPressed: () {
                  context.push("/meeting");
                },
                child: Text("Go to meeting"),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheduleInfo = context.watch<ScheduleInfo>();
    scheduleInfo.sortBookedLessons();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                title: Text("Schedule"),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      context.push("/schedule/history");
                    },
                    icon: Icon(Icons.history),
                  ),
                ],
              ),
              vpad(10),
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: () {
                    var bookedLessons = scheduleInfo.bookedLessons;
                    if (bookedLessons == null || bookedLessons.isEmpty) {
                      return Center(child: Text('You have no booked lessons'));
                    } else {
                      bookedLessons.sort((a, b) {
                        var comparison = a.date.compareTo(b.date);
                        if (comparison != 0) return comparison;
                        comparison = a.start.compareTo(b.start);
                        if (comparison != 0) return comparison;
                        return a.end.compareTo(b.end);
                      });
                      return ListView.separated(
                        itemCount: bookedLessons.length,
                        itemBuilder: ((context, index) {
                          return _buildLessonCard(
                              context, bookedLessons[index]);
                        }),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => Divider(),
                      );
                    }
                  }()),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/src/api/schedule_api.dart';
import 'package:lettutor/src/custom_widgets/pro_avatar.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/models/lesson.dart';
import 'package:lettutor/src/models/schedule/booking_info.dart';
import 'package:lettutor/src/models/schedule_info.dart';
import 'package:lettutor/src/models/tutor/tutor.dart';
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
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = true;
  bool _loadNoMore = false;
  List<BookingInfo> _schedule = [];
  int _page = 1;
  int _perPage = 10;

  @override
  void initState() {
    super.initState();
    _getFirstPage();
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     _getNextPage();
    //   }
    // });
  }

  int _checkSchedule(List<BookingInfo> schedule) {
    DateTime currentTime = DateTime.now();
    for (int i = 0; i < schedule.length; i++) {
      DateTime scheduleTime = DateTime.fromMillisecondsSinceEpoch(
          schedule[i].scheduleDetailInfo!.startPeriodTimestamp!);
      if (scheduleTime.isAfter(currentTime)) {
        return i;
      }
    }
    return -1;
  }

  void _getFirstPage() async {
    setState(() {
      _page = 1;
      _isLoading = true;
    });

    try {
      List<BookingInfo> schedule =
          // await ScheduleApi.getBookedClass(page: _page, perPage: _perPage);
          await ScheduleApi.getUpcomingLesson();
      // check if schedule contains any value that beyond current time, if so, return its index, else get the next page
      // int index = _checkSchedule(schedule);
      // while (index == -1) {
      //   _page++;
      //   schedule = await ScheduleApi.getBookedClass(
      //       page: _page, perPage: _perPage);
      //   index = _checkSchedule(schedule);
      // }
      // schedule = schedule.sublist(index);

      setState(() {
        _page++;
        _isLoading = false;
        _schedule = schedule;
        _loadNoMore = schedule.length < 4;
      });
    } catch (e) {
      print("[SchedulePage::_getFirstPage] $e");
    }
  }

  void _getNextPage() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<BookingInfo> nextPage =
          await ScheduleApi.getBookedClass(page: _page, perPage: _perPage);
      setState(() {
        if (nextPage.isEmpty) {
          _loadNoMore = true;
        } else {
          _page++;
          _schedule.addAll(nextPage);
        }
        _isLoading = false;
      });
    } catch (e) {
      print("[SchedulePage::_getNextPage] $e");
    }
  }

  Widget _buildClassCard(BuildContext context, BookingInfo info) {
    final theme = Theme.of(context);
    final Tutor? tutor = info.scheduleDetailInfo?.scheduleInfo?.tutorInfo;
    final String date = DateFormat('EEE, yyyy MMM dd').format(
        DateTime.fromMillisecondsSinceEpoch(
            info.scheduleDetailInfo!.startPeriodTimestamp!));
    final String start = DateFormat.Hm().format(
        DateTime.fromMillisecondsSinceEpoch(
            info.scheduleDetailInfo!.startPeriodTimestamp!));
    final String end = DateFormat.Hm().format(
        DateTime.fromMillisecondsSinceEpoch(
            info.scheduleDetailInfo!.endPeriodTimestamp!));

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
            date,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "$start - $end",
            style: theme.textTheme.titleSmall,
          ),
          Divider(),
          Row(
            children: [
              ProAvatar(url: tutor?.avatar ?? ""),
              hpad(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tutor?.name ?? "N/A",
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
            ],
          ),
          vpad(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {
                  _cancelClass(info.id);
                },
                style: OutlinedButton.styleFrom(),
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              FilledButton(
                onPressed: () {
                  // context.push("/meeting");
                },
                child: Text("Go to meeting"),
              ),
            ],
          )
        ],
      ),
    );
  }

  _cancelClass(String? scheduleId) async {}

  @override
  Widget build(BuildContext context) {
    final scheduleInfo = context.watch<ScheduleInfo>();
    scheduleInfo.sortBookedLessons();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
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
                child: _schedule.isEmpty
                    ? _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : Center(child: Text("You haven't booked any classes"))
                    : ListView.separated(
                        itemCount: _schedule.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          if (index == _schedule.length) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return _buildClassCard(context, _schedule[index]);
                          }
                        }),
                        separatorBuilder: (context, index) => vpad(10),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

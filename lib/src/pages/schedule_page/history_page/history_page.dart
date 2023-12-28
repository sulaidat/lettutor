import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/src/api/schedule_api.dart';
import 'package:lettutor/src/custom_widgets/pro_avatar.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/models/lesson.dart';
import 'package:lettutor/src/models/schedule/booking_info.dart';
import 'package:lettutor/src/models/schedule_info.dart';
import 'package:lettutor/src/models/tutor/tutor.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool _dontLoadMore = false;
  List<BookingInfo> _history = [];
  bool _isLoading = false;
  int _page = 1;
  int _perPage = 20;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _getFirstPage();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getNextPage();
      }
    });
  }

  _getFirstPage() async {
    setState(() {
      _page = 1;
      _isLoading = true;
    });

    try {
      List<BookingInfo> history =
          await ScheduleApi.getHistory(page: _page, perPage: _perPage);
      setState(() {
        _page++;
        _history = history;
        _dontLoadMore = history.length < 4;
        _isLoading = false;
      });
    } catch (e) {
      print("[HistoryPage::_getFirstPage] $e");
    }
  }

  _getNextPage() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<BookingInfo> history =
          await ScheduleApi.getHistory(page: _page, perPage: _perPage);
      setState(() {
        if (history.isEmpty) {
          _dontLoadMore = true;
        } else {
          _page++;
          _history.addAll(history);
        }
        _isLoading = false;
      });
    } catch (e) {
      print("[HistoryPage::_getNextPage] $e");
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
                  // _cal(info.id);
                },
                style: OutlinedButton.styleFrom(),
                child: Text(
                  "Report",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              FilledButton(
                onPressed: () {
                  // if (_canJoin(info.scheduleDetailInfo!.endPeriodTimestamp!)) {
                  //   joinMeeting(
                  //       info.studentMeetingLink!.split("token=")[1],
                  //       info.userId!,
                  //       info.scheduleDetailInfo!.scheduleInfo!.tutorId!);
                  // }
                },
                child: Text("Add a rating"),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheduleInfo = context.read<ScheduleInfo>();
    scheduleInfo.sortCompletedLessons();
    final completedLessons = scheduleInfo.completedLessons;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              AppBar(
                title: Text("History"),
                centerTitle: true,
              ),
              vpad(10),
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: _history.isEmpty
                      ? _isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const Center(
                              child: Text("You have no completed lessons"),
                            )
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => vpad(10),
                          itemCount: _dontLoadMore
                              ? _history.length
                              : _history.length + 1,
                          itemBuilder: (context, index) {
                            if (index == _history.length) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return _buildClassCard(context, _history[index]);
                            }
                          },
                        )
                  // () {
                  //   if (completedLessons!.isEmpty) {
                  //     return Text("You have no completed lessons");
                  //   } else {
                  //     return ListView.separated(
                  //       itemBuilder: (context, index) {
                  //         return _buildClassCard(context, _history[index]);
                  //       },
                  //       separatorBuilder: (context, index) {
                  //         return vpad(10);
                  //       },
                  //       shrinkWrap: true,
                  //       physics: NeverScrollableScrollPhysics(),
                  //       itemCount: completedLessons.length,
                  //     );
                  //   }
                  // }()
                  )
            ],
          ),
        ),
      ),
    );
  }
}

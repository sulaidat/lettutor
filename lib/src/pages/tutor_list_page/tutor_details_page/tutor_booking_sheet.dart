import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/src/api/schedule_api.dart';
import 'package:lettutor/src/custom_widgets/pro_heading.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/pages/login_page/auth.dart';
import 'package:lettutor/src/models/schedule/schedule.dart';

class TutorBookingSheet extends StatefulWidget {
  const TutorBookingSheet({super.key, required this.tutorId});

  final String tutorId;

  @override
  State<TutorBookingSheet> createState() => _TutorBookingSheetState();
}

class _TutorBookingSheetState extends State<TutorBookingSheet> {
  List<(int, int, String)> _timeStamps = [];

  bool _isLoading = true;

  bool _timecmp(int time1, int time2) {
    if (time1.compareTo(time2) > 0) return true;
    return false;
  }

  _fetchTutorSchedules() async {
    final start = DateTime.now();
    final end = start.add(const Duration(days: 365));
    ScheduleApi.getTutorSchedule(
      token: AppState.token.access!.token!,
      tutorId: widget.tutorId,
      start: start,
      end: end,
    ).then((value) {
      final List<Schedule> data = value;
      final now = DateTime.now().millisecondsSinceEpoch;
      var res = data.where((element) {
        if (element.startTimestamp == null) return false;
        return _timecmp(element.startTimestamp!, now);
      }).toList();
      res = res.where((element) => false == element.isBooked).toList();
      res.sort((a, b) => a.startTimestamp!.compareTo(b.startTimestamp!));

      setState(() {
        _timeStamps = res
            .map((e) => (
                  e.startTimestamp!,
                  e.endTimestamp!,
                  e.scheduleDetails!.first.id!
                ))
            .toList();
        _isLoading = false;
      });
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    });
  }

  _book(String scheduleId) async {
    await ScheduleApi.bookClass(
      token: AppState.token.access!.token!,
      scheduleIds: [scheduleId],
    ).then((value) {
      print(value);
      Navigator.pop(context);
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      _fetchTutorSchedules();
    }

    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Heading3(text: 'Choose date'),
                    vpad(5),
                    _timeStamps.isEmpty
                        ? const Center(
                            child: Text(
                                'No available class for the next 365 days'))
                        : Expanded(
                            child: ListView.builder(
                              itemCount: _timeStamps.length,
                              itemBuilder: (context, index) {
                                final start = DateFormat.Hm().format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        _timeStamps[index].$1));
                                final end = DateFormat.Hm().format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        _timeStamps[index].$2));
                                return ListTile(
                                  title: Text(DateFormat.MMMEd().format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          _timeStamps[index].$1))),
                                  subtitle: Text('Start: $start, End: $end'),
                                  trailing: FilledButton(
                                    onPressed: () {
                                      _book(_timeStamps[index].$3);
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Booking successful, please check your schedule')),
                                      );
                                    },
                                    child: Text("Book"),
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
      ),
    );
  }
}

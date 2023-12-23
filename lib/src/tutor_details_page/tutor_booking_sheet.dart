import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/src/api/schedule_api.dart';
import 'package:lettutor/src/api/tutor_api.dart';
import 'package:lettutor/src/custom_widgets/pro_chips_from_string.dart';
import 'package:lettutor/src/custom_widgets/pro_heading.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/login_page/auth.dart';
import 'package:lettutor/src/models/schedule/schedule.dart';
import 'package:lettutor/src/tutor_details_page/booking_hour_page.dart';

class TutorBookingSheet extends StatefulWidget {
  const TutorBookingSheet({super.key, required this.tutorId});

  final String tutorId;

  @override
  State<TutorBookingSheet> createState() => _TutorBookingSheetState();
}

class _TutorBookingSheetState extends State<TutorBookingSheet> {
  bool _isLoading = true;
  List<Schedule> _schedules = [];
  List<(int, int, String)> _timeStamps = [];

  bool _timecmp(int time1, int time2) {
    if (time1.compareTo(time2) > 0) return true;
    return false;
  }

  _fetchTutorSchedules() async {
    ScheduleApi.getTutorSchedule(
            token: AppState.token.access!.token!, tutorId: widget.tutorId)
        .then((value) {
      final List<Schedule> data = value;
      final now = DateTime.now().millisecondsSinceEpoch;
      var res = data.where((element) {
        if (element.startTimestamp == null) return false;
        return _timecmp(element.startTimestamp!, now);
      }).toList();
      res = res.where((element) => false == element.isBooked).toList();
      res.sort((a, b) => a.startTimestamp!.compareTo(b.startTimestamp!));

      setState(() {
        _schedules = res;
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
                        ? const Center(child: Text('No available schedule'))
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
                                    onPressed: () async {
                                      await ScheduleApi.bookClass(
                                        token: AppState.token.access!.token!,
                                        scheduleIds: [_timeStamps[index].$3],
                                      ).then((value) {
                                        print(value);
                                        Navigator.pop(context);
                                      }).catchError((e) {
                                        print(e.toString());
                                      });
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

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/models/schedule/schedule.dart';

class ScheduleApi {
  static getTutorSchedule({
    required String token,
    required String tutorId,
    required DateTime start,
    required DateTime end,
  }) async {
    print(start.millisecondsSinceEpoch);
    print(end.millisecondsSinceEpoch);
    final res = await Dio().get(
      Constants.schedule,
      options: Constants.authOption(token),
      queryParameters: {
        'tutorId': tutorId,
        'startTimestamp': start.millisecondsSinceEpoch,
        'endTimestamp': end.millisecondsSinceEpoch,
      },
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    final List<Schedule> schedules = (res.data['scheduleOfTutor'] as List)
        .map((e) => Schedule.fromJson(e))
        .toList();
    return schedules;
  }

  static bookClass(
      {required String token, required List<String> scheduleIds}) async {
    final test = json.encode({
      "scheduleDetailIds": scheduleIds,
      "note": "",
    });
    print(test);
    final res = await Dio().post(
      Constants.booking,
      data: json.encode({
        "scheduleDetailIds": scheduleIds,
        "note": "",
      }),
      options: Constants.authOption(token),
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    return res.data['message'];
  }
}

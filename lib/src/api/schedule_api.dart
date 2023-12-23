import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/models/schedule/schedule.dart';

class ScheduleApi {
  static getTutorSchedule(
      {required String token, required String tutorId}) async {
    final res = await Dio().post(
      Constants.schedule,
      data: {'tutorId': tutorId},
      options: Constants.authOption(token),
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    final List<dynamic> schedules = res.data['data'];
    return schedules.map((e) => Schedule.fromJson(e)).toList();
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

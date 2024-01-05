import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/pages/login_page/auth.dart';
import 'package:lettutor/src/models/schedule/booking_info.dart';
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

  static getBookedClass({
    required int page,
    required int perPage,
  }) async {
    final res = await Dio().get(
      Constants.bookingListStudent,
      queryParameters: {
        'page': page,
        'perPage': perPage,
        "dateTimeLte": DateTime.now().millisecondsSinceEpoch,
        "orderBy": "meeting",
        "sortBy": "desc",
        "startTimestamp": DateTime.now().millisecondsSinceEpoch,
      },
      options: Constants.authOption(AppState.token.access!.token!),
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    final List<BookingInfo> schedules = (res.data['data']["rows"] as List)
        .map((e) => BookingInfo.fromJson(e))
        .toList();
    return schedules;
  }

  static getUpcomingLesson() async {
    final res = await Dio().get(
      Constants.upcommingLesson,
      options: Constants.authOption(AppState.token.access!.token!),
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    List<BookingInfo> lessons =
        (res.data["data"] as List).map((e) => BookingInfo.fromJson(e)).toList();
    if (lessons.isEmpty) {
      // throw Exception("You have not booked any lesson");
      return null;
    }
    lessons.sort(
      (a, b) {
        if (a.scheduleDetailInfo == null || b.scheduleDetailInfo == null) {
          return 0;
        }
        if (a.scheduleDetailInfo!.startPeriodTimestamp == null ||
            b.scheduleDetailInfo!.startPeriodTimestamp == null) {
          return 0;
        }
        return a.scheduleDetailInfo!.startPeriodTimestamp!
            .compareTo(b.scheduleDetailInfo!.startPeriodTimestamp!);
      },
    );
    lessons = lessons.where((element) {
      if (element.scheduleDetailInfo == null) {
        return false;
      }
      if (element.scheduleDetailInfo!.endPeriodTimestamp == null) {
        return false;
      }
      return element.scheduleDetailInfo!.endPeriodTimestamp! >
          DateTime.now().millisecondsSinceEpoch;
    }).toList();
    return lessons;
  }

  static cancelClass({required String id}) async {
    final res = await Dio().delete(
      Constants.booking,
      data: json.encode({
        "scheduleDetailIds": [id]
      }),
      options: Constants.authOption(AppState.token.access!.token!),
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    return res.data['message'];
  }

  static getHistory({
    required int page,
    required int perPage,
  }) async {
    print("[getHistory] page: $page, perPage: $perPage");
    print(DateTime.now()
        .subtract(const Duration(minutes: 35))
        .millisecondsSinceEpoch
        .toString());
    final res = await Dio().get(
      Constants.bookingListStudent,
      queryParameters: {
        'page': page,
        'perPage': perPage,
        "dateTimeLte": DateTime.now()
            .subtract(const Duration(minutes: 35))
            .millisecondsSinceEpoch,
        "orderBy": "meeting",
        "sortBy": "desc",
      },
      options: Constants.authOption(AppState.token.access!.token!),
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    final List<BookingInfo> schedules = (res.data['data']["rows"] as List)
        .map((e) => BookingInfo.fromJson(e))
        .toList();
    return schedules;
  }
}

import 'package:dio/dio.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/models/schedule/booking_info.dart';
import 'package:lettutor/src/models/tutor/tutor.dart';

class UserApi {
  static getTotalLessonTime({required String token}) async {
    final res = await Dio().get(
      Constants.total,
      options: Constants.authOption(token),
    );
    if (res.statusCode != 200) {
      throw Exception("Error when fetching total lesson time");
    }
    return res.data['total'];
  }

  static getUpcomingLesson({required String token}) async {
    final res = await Dio().get(
      Constants.upcommingLesson,
      options: Constants.authOption(token),
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    final List<dynamic> data = res.data["data"];
    if (data.isEmpty) {
      // throw Exception("You have not booked any lesson");
      return null;
    }
    List<BookingInfo> lessons =
        data.map((e) => BookingInfo.fromJson(e)).toList();
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
    if (lessons.isNotEmpty) {
      return lessons.first;
    } else {
      // throw Exception("You have not booked any lesson");
      return null;
    }
  }
}

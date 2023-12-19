import 'package:dio/dio.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/models/schedule/booking_info.dart';

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
      throw Exception("You have not booked any lesson");
    }
    List<BookingInfo> lessons = data.map((e) => BookingInfo.fromJson(e)).toList();
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
      throw Exception("Error when fetching upcoming lesson");
    }
  }

  // static updateUserInfo({
  //   required String token,
  //   required String name,
  //   required String country,
  //   required String phone,
  //   required String birthday,
  //   required String level,
  //   required List<String> learnTopics,
  //   required List<String> testPreparations,
  // }) async {
  //   final url = Constants.baseUrl + Constants.userInfo;
  //   var data = {
  //     "name": name,
  //     "country": country,
  //     "phone": phone,
  //     "birthday": birthday,
  //     "level": level,
  //     "learnTopics": learnTopics,
  //     "testPreparations": testPreparations
  //   };
  //   try {
  //     final res = await Dio().put(
  //       url,
  //       data: data,
  //       options: Constants.authOption(token)
  //     );
  //     User user = User.fromJsonFromRegisterResponse(res.data["user"]);
  //     if (context.mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(res.data["message"]),
  //         ),
  //       );
  //     }
  //     return user;
  //   } on DioException catch (e) {
  //     if (context.mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(e.response!.data['message']),
  //         ),
  //       );
  //     }
  //   }
  //   return null;
  // }
}

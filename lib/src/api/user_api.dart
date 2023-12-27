import 'package:dio/dio.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/login_page/auth.dart';
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

 
}

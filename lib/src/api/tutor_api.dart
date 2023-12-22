import 'package:dio/dio.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/models/tutor/tutor.dart';
import 'package:lettutor/src/models/tutor/tutor_info.dart';

class TutorApi {
  static getListTutorWithPage({
    required int page,
    required int perPage,
    required String token,
  }) async {
    final res = await Dio().get(
        Constants.tutorListWithPage(page: page, perPage: perPage),
        options: Constants.authOption(token));

    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }

    final List<dynamic> tutors = res.data['tutors']['rows'];
    return tutors.map((e) => Tutor.fromJson(e)).toList();
  }

  static changeFavorite({
    required String token,
    required String tutorId,
  }) async {
    final res = await Dio().post(
      Constants.addToFavorite,
      data: {
        "tutorId": tutorId,
      },
      options: Constants.authOption(token),
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    return res.data['message'];
  }

  static getTutorInfoById({
    required String token,
    required String tutorId,
  }) async {
    final res = await Dio().get(
      Constants.tutorById(tutorId),
      options: Constants.authOption(token),
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    final tutorInfo = TutorInfo.fromJson(res.data);
    return tutorInfo;
  }

  static reportTutor({
    required String token,
    required String tutorId,
    required String content,
  }) async {
    final res = await Dio().post(
      Constants.report,
      data: {
        "tutorId": tutorId,
        "content": content,
      },
      options: Constants.authOption(token),
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    return res.data['message'];
  }
}

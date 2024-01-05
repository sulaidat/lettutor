import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/pages/login_page/auth.dart';
import 'package:lettutor/src/models/tutor/search_info.dart';
import 'package:lettutor/src/models/tutor/tutor.dart';
import 'package:lettutor/src/models/tutor/tutor_feedback.dart';
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
    return res.data['result'] != 1;
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

  static searchTutor(
    int perPage,
    int page,
    SearchInfo? searchInfo,
  ) async {
    final data = searchInfo != null
        ? {
            "filters": {
              "specialties": searchInfo.filters!.specialties,
              // "nationality": {
              //   "isVietNamese": searchInfo.filters!.nationality!.isVietNamese,
              //   "isNative": searchInfo.filters!.nationality!.isNative
              // }, // not working correctly
            },
            "search": searchInfo.search,
            "page": page,
            "perPage": perPage
          }
        : {
            "page": page,
            "perPage": perPage,
          };
    print("[searchTutor]: ${jsonEncode(data)}");

    final res = await Dio().post(
      Constants.tutorSearch,
      data: data,
      options: Constants.authOption(AppState.token.access!.token!),
    );

    if (res.statusCode != 200) {
      throw Exception("Exception from TutorApi.searchTutor");
    }

    List<Tutor> tutors =
        (res.data['rows'] as List).map((e) => Tutor.fromJson(e)).toList();
    return tutors;
  }

  static getFeedback(String userId, int perPage, int page) async {
    print("[getFeedback]: ${Constants.feedback(userId, page, perPage)}");
    final res = await Dio().get(
      Constants.feedback(userId, page, perPage),
      options: Constants.authOption(AppState.token.access!.token!),
    );

    if (res.statusCode != 200) {
      throw Exception("Exception from TutorApi.getFeedback");
    }

    List<TutorFeedback> feedbacks = (res.data['data']['rows'] as List)
        .map((e) => TutorFeedback.fromJson(e))
        .toList();
    return feedbacks;
  }

    static getAllFeedback(String userId) async {
    print("[getAllFeedback]: ${Constants.allFeedback(userId)}");
    final res = await Dio().get(
      Constants.allFeedback(userId),
      options: Constants.authOption(AppState.token.access!.token!),
    );

    if (res.statusCode != 200) {
      throw Exception("Exception from TutorApi.getFeedback");
    }

    List<TutorFeedback> feedbacks = (res.data['data']['rows'] as List)
        .map((e) => TutorFeedback.fromJson(e))
        .toList();
    return feedbacks;
  }
}

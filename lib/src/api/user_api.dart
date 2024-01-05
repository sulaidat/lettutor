import 'package:dio/dio.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/models/user/user.dart';
import 'package:lettutor/src/pages/login_page/auth.dart';

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

  static updateUserInfo({
    required String name,
    required String country,
    required String phone,
    required String birthday,
    required String level,
    required List<String> learnTopics,
    required List<String> testPreparations,
    String? avatar,
  }) async {
    avatar ??= AppState.user.avatar;
    final data = {
      "name": name,
      "country": country,
      "phone": phone,
      "birthday": birthday,
      "level": level,
      "learnTopics": learnTopics,
      "testPreparations": testPreparations,
      "avatar": avatar,
    };
    print("[updateUserInfo] data: $data");
    final res = await Dio().put(
      Constants.userInfo,
      data: data,
      options: Constants.authOption(AppState.token.access!.token!),
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    final User user = User.fromJson(res.data['user']);
    return user;
  }

  static getLearnTopics() async {
    final res = await Dio().get(
      Constants.learnTopics,
      options: Constants.authOption(AppState.token.access!.token!),
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    final List<LearnTopic> learnTopics =
        (res.data as List).map((e) => LearnTopic.fromJson(e)).toList();
    return learnTopics;
  }

  static getTestPreparations() async {
    final res = await Dio().get(
      Constants.testPreparations,
      options: Constants.authOption(AppState.token.access!.token!),
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    final List<TestPreparation> learnTopics =
        (res.data as List).map((e) => TestPreparation.fromJson(e)).toList();
    return learnTopics;
  }

  static becomeTutor({
    required String name,
    required String country,
    required String birthday,
    required String interests,
    required String education,
    required String experience,
    required String languages,
    required String bio,
    required String specialties,
  }) async {
    final data = FormData.fromMap({
      "name": name,
      "country": country,
      "birthday": birthday,
      "interests": interests,
      "education": education,
      "experience": experience,
      "languages": languages,
      "bio": bio,
      "specialties": specialties,
      "price": 5000,
    });
    print("[becomeTutor] data: $data");
    final res = await Dio().post(
      Constants.becomeTutor,
      data: data,
      options: Constants.authOption(AppState.token.access!.token!),
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    return true;
  }

  static getUserInfo() async {
    final res = await Dio().get(
      Constants.userInfo,
      options: Constants.authOption(AppState.token.access!.token!),
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    User user = User.fromJson(res.data['user']);
    return user;
  }
}

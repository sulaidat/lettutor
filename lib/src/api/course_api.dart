import 'package:dio/dio.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/models/course/course.dart';
import 'package:lettutor/src/pages/login_page/auth.dart';

class CourseApi {

  static getCourses(int perPage, int page) async {
    print("[getCourses] page: $page, perPage: $perPage");
    final res = await Dio().get(
      Constants.coursePage(page, perPage),
      options: Constants.authOption(AppState.token.access!.token!),
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    final List<Course> courses = (res.data['data']["rows"] as List)
        .map((e) => Course.fromJson(e))
        .toList();
    return courses;
  }
  
}

import 'package:dio/dio.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/models/user/token.dart';
import 'package:lettutor/src/models/user/user.dart';

class AuthApi {
  static bool isLoggedIn = false;

  static login({
    required String email,
    required String password,
  }) async {
    final res = await Dio().post(
      "${Constants.baseUrl}${Constants.login}",
      data: {
        "email": email,
        "password": password,
      },
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    final user = User.fromJson(res.data['user']);
    final token = Token.fromJson(res.data['tokens']);
    return (user, token);
  }

  // TODO
  // static loginByGoogle() {}
  // static loginByFacebook() {}

  static refreshToken({required String refreshToken}) async {
    final res = await Dio().post(
      "${Constants.baseUrl}${Constants.refreshToken}",
      data: {
        "refreshToken": refreshToken,
        "timezone": "7",
      },
    );
    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }
    final user = User.fromJson(res.data['user']);
    final token = Token.fromJson(res.data['tokens']);
    return (user, token);
  }

  static register({required String email, required String password}) async {
    final res =
        await Dio().post("${Constants.baseUrl}${Constants.register}", data: {
      "email": email,
      "password": password,
    }, options: Options(
      validateStatus: (status) {
        return status! < 500;
      },
    ));
    if (res.statusCode != 201) {
      throw Exception(res.data['message']);
    }
  }

  static forgotPassword({
    required String email,
  }) async {
    final res = await Dio().post(
      "${Constants.baseUrl}${Constants.forgotPassword}",
      data: {
        "email": email,
      },
    );
    return res.data['message'];
  }
}

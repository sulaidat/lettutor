import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static bool isLoggedIn = false;

  static login(String email, String password, BuildContext context) async {
    final url = Constants.baseUrl + Constants.login;
    final req = {
      "email": email,
      "password": password,
    };
    try {
      final res = await Dio().post(url, data: req);
      if (res.statusCode == 200) {
        print(res.data['user']);
        return User.fromJson(res.data['user']);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(res.data['message']),
            ),
          );
        }
        return null;
      }
    } on DioException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.response!.data['message']),
          ),
        );
      }
      return null;
    }
  }

  static register(String email, String password, BuildContext context) async {
    final url = Constants.baseUrl + Constants.register;
    final data = {
      "email": email,
      "password": password,
    };
    try {
      final res = await Dio().post(url,
          data: data,
          options: Options(contentType: Headers.formUrlEncodedContentType));

      User user = User.fromJsonFromRegisterResponse(res.data["user"]);

      String accessToken = res.data["tokens"]["access"]["token"];
      final pref = await SharedPreferences.getInstance();
      pref.setString("ACCESS_TOKEN", accessToken);

      return user;
    } on DioException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.response!.data['message']),
          ),
        );
      }
      return null;
    }
  }

  static forgotPassword(String email) async {
    final url = Constants.baseUrl + Constants.forgotPassword;
    final data = {
      "email": email,
    };
    try {
      final res = await Dio().post(url, data: data);
      return res.data["message"];
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

  


  // updateUserInfo(
  //   String name,
  //   String country,
  //   String phone,
  //   String birthday,
  //   String level,
  //   List<String> learnTopis,
  //   List<String> testPreparations,
  //   BuildContext context,
  // ) async {
  //   final url = Constants.baseUrl + Constants.updateUserInfo;
  // }


}

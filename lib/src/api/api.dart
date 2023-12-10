import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/models/user.dart';

class Api {
  Future<User?> login(String email, String password, BuildContext context) async {
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
}
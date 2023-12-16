import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/src/api/constants.dart';
import 'package:lettutor/src/models/user/user.dart';

// class UserApi {
//   static getTotalLessonTime({required String token}) async {
//     final res = await Dio().get("")
//   }

//   static updateUserInfo({
//     required String token,
//     required String name,
//     required String country,
//     required String phone,
//     required String birthday,
//     required String level,
//     required List<String> learnTopics,
//     required List<String> testPreparations,
//   }) async {
//     final url = Constants.baseUrl + Constants.userInfo;
//     var data = {
//       "name": name,
//       "country": country,
//       "phone": phone,
//       "birthday": birthday,
//       "level": level,
//       "learnTopics": learnTopics,
//       "testPreparations": testPreparations
//     };
//     try {
//       final res = await Dio().put(
//         url,
//         data: data,
//         options: Constants.authOption(token)
//       );
//       User user = User.fromJsonFromRegisterResponse(res.data["user"]);
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(res.data["message"]),
//           ),
//         );
//       }
//       return user;
//     } on DioException catch (e) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(e.response!.data['message']),
//           ),
//         );
//       }
//     }
//     return null;
//   }
// }
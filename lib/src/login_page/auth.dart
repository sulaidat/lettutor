import 'package:lettutor/src/models/user/user.dart';
import '../models/user/token.dart';

class AppState {
  static bool isLoggedIn = false;
  static bool onLogin = false;
  static bool onReset = false;
  static User user = User();
  static Token token = Token();
}

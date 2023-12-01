import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bcrypt/bcrypt.dart';

class AuthService extends ChangeNotifier {
  bool _isLoggedIn = false;
  Map<String, String> _users = {};
  bool onLogin = false;
  bool onReset = false;
  String avatar =
      'https://anh.eva.vn//upload/4-2016/images/2016-11-28/1480309415-moc-uyen-thanh-ava.jpg';
      String username = 'admin';

  // Singleton instance
  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  bool get isLoggedIn => _isLoggedIn;

  bool userExists(String username) {
    return _users.containsKey(username);
  }

  void logIn(String username, String password) {
    // Check if user exists and password is correct
    if (_users.containsKey(username) &&
        BCrypt.checkpw(password, _users[username]!)) {
      _isLoggedIn = true;
      notifyListeners();
    } else {
      // throw Exception('Invalid username or password');
    }
  }

  void logOut() {
    _isLoggedIn = false;
    notifyListeners();
  }

  void register(String username, String password) {
    // Validate password
    // ...

    String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
    _users[username] = hashedPassword;
    notifyListeners();
  }

  void changePassword(String username, String password) {
    // Validate password
    // ...

    String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
    _users[username] = hashedPassword;
    notifyListeners();
  }

  void sendPasswordResetEmail(String email) {
    // Send email
    // ...
  }
}

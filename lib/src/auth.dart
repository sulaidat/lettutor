import 'package:flutter/material.dart';

class AppAuth extends ChangeNotifier {
  bool _loggedIn = false;

  @override
  bool operator ==(Object other) =>
      other is AppAuth && other._loggedIn == _loggedIn;

  @override
  int get hashCode => _loggedIn.hashCode;

  bool get loggedIn => _loggedIn;

  Future<void> logOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    // Sign out.
    _loggedIn = false;
    notifyListeners();
  }

  Future<bool> logIn(String username, String password) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    // Sign in. Allow any password.
    _loggedIn = true;
    notifyListeners();
    return _loggedIn;
  }

  static AppAuth of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<AppAuthScope>()!
      .notifier!;
}

class AppAuthScope extends InheritedNotifier<AppAuth> {
  const AppAuthScope({
    required super.notifier,
    required super.child,
    super.key,
  });
}
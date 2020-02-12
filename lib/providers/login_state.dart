import 'package:flutter/material.dart';

class LoginState with ChangeNotifier {
  bool _loggedIn = false;

  bool isLogggedIn() => _loggedIn;

  void login() {
    _loggedIn = true;
    notifyListeners();
    print("login true");
  }

  void logout() {
    _loggedIn = false;
    notifyListeners();
    print("login false");
  }
}

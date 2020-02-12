import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginState with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _loggedIn = false;
  bool _loading = false;

  bool isLogggedIn() => _loggedIn;
  bool isLoading() => _loading;

  FirebaseUser userLogin;

  void login() async {
    // _loggedIn = true;
    // notifyListeners();
    //var user = await _handleSignIn();
    _loading = true;
    notifyListeners();

    userLogin = await _handleSignIn();

    _loading = false;
    if (userLogin != null) {
      _loggedIn = true;
      notifyListeners();
    } else {
      _loggedIn = false;
      notifyListeners();
    }
  }

  void logout() {
    _loggedIn = false;
    notifyListeners();
  }

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    // print("signed in " + user.displayName);
    // print("user email: ${user.email}");
    // print("user photoUrl: ${user.photoUrl}");
    return user;
  }
}

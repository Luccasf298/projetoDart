import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  UserProvider() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }
  bool get isAuthenticated => _user != null;
  User? get user => _user;
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

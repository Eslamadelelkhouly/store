import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store/errors/error_signup.dart';
import 'package:store/services/auth/auth_services.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = true;
  String error = '';
  Future<void> signUp({required String email, required String password}) async {
    AuthServices auth = AuthServices();
    try {
      isLoading = true;
      await auth.signUpWithEmailAndPassword(email, password);
      error = 'success';
      isLoading = false;
    } on FirebaseAuthException catch (e) {
      error = ErrorSignup.fetcherror(error: e.code);
      log(error);
    }
    notifyListeners();
  }
}

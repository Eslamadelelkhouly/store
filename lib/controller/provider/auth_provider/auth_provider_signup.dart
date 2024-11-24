import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store/controller/errors/error_signup.dart';

class AuthProviderSignUpCreate extends ChangeNotifier {
  bool isLoading = false;
  String error = '';
  bool state = false;

  Future<void> signUp({required String email, required String password}) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      error =
          'No internet connection. Please check your connection and try again.';
      state = false;
      isLoading = false;
      notifyListeners();
      return;
    }
    log('before try');
    try {
      isLoading = true;
      notifyListeners();
      log('after try still');
      final FirebaseAuth auth = FirebaseAuth.instance;

      auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      log('create email');
      // Check if sign-up was successful by confirming a valid user in userCredential
      if (true) {
        error = 'success';
        state = true;
        log('sucess');
      }
    } on FirebaseAuthException catch (e) {
      // Firebase-specific error handling
      error = ErrorSignup.fetcherror(error: e.code);
      state = false;
    } catch (e) {
      // General error handling
      print("Unexpected error during sign-up: $e");
      error = "An unexpected error occurred";
      state = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store/constant/common_functions.dart';
import 'package:store/constant/constants.dart';
import 'package:store/model/user_model.dart';
import 'package:store/view/Auth%20Screen/signin_view.dart';

class UserDataCRUD {
  static Future addNewUser({
    required UserModel usermodel,
    required BuildContext context,
  }) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.email)
          .set(usermodel.toMap())
          .whenComplete(() {
        log('Data Added');
        CommonFunctions.showToast(
          context: context,
          message: 'User Added Successful',
        );
        Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
            child: const SigninView(),
            type: PageTransitionType.rightToLeft,
          ),
          (route) => false,
        );
      });
    } catch (e) {
      log(e.toString());
      CommonFunctions.showToast(
        context: context,
        message: e.toString(),
      );
    }
  }

  static Future<bool> checkUser() async {
    bool userPresent = false;
    try {
      await firestore
          .collection('users')
          .where('email', isEqualTo: auth.currentUser!.email)
          .get()
          .then((value) {
        value.size > 0 ? userPresent = true : userPresent = false;
      });
    } catch (e) {
      log(e.toString());
    }
    log(userPresent.toString());
    return userPresent;
  }
}

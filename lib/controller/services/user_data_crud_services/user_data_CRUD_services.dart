import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store/constant/common_functions.dart';
import 'package:store/constant/constants.dart';
import 'package:store/model/user_model.dart';

class UserDataCRUD {
  static addNewUser({
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
      });
    } catch (e) {
      log(e.toString());
      CommonFunctions.showToast(
        context: context,
        message: e.toString(),
      );
    }
  }

  static Future checkUser() async {
    try {
      await firestore
          .collection('users')
          .where('email', isEqualTo: auth.currentUser!.email)
          .get()
          .then((value) {
        value.size > 0 ? true : false;
      });
    } catch (e) {
      log(e.toString());
    }
  }
}

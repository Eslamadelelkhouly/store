import 'dart:developer';

import 'package:flutter/material.dart';
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
      });
    } catch (e) {}
  }
}

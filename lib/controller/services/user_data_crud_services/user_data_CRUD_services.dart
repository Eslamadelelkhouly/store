import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store/constant/common_functions.dart';
import 'package:store/constant/constants.dart';
import 'package:store/model/address_model.dart';
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

  static Future addUserAddress({
    required BuildContext context,
    required AddressModel addressModel,
    required String docID,
  }) async {
    try {
      await firestore
          .collection('Adress')
          .doc(auth.currentUser!.email)
          .collection('address')
          .doc(docID)
          .set(addressModel.toMap())
          .whenComplete(() {
        log('Data Added');
        CommonFunctions.showToast(
          context: context,
          message: 'Address Added Successful',
        );
        Navigator.pop(context);
      });
    } catch (e) {
      log(e.toString());
      CommonFunctions.showToast(
        context: context,
        message: e.toString(),
      );
    }
  }

  static Future<bool> checkUserAdress() async {
    bool addressPresent = false;
    try {
      await firestore
          .collection('Adress')
          .doc(auth.currentUser!.email)
          .collection('address')
          .get()
          .then((value) {
        value.size > 0 ? addressPresent = true : addressPresent = false;
      });
    } catch (e) {
      log(e.toString());
    }
    log(addressPresent.toString());
    return addressPresent;
  }

  static Future<List<AddressModel>> getAllAddress() async {
    List<AddressModel> allAddress = [];
    AddressModel defaultAddress = AddressModel();
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Adress')
          .doc(auth.currentUser!.email)
          .collection('address')
          .get();
      snapshot.docs.forEach(
        (element) {
          allAddress.add(AddressModel.fromMap(element.data()));
          AddressModel currentAddress = AddressModel.fromMap(element.data());
          if (currentAddress.isDefault == true) {
            defaultAddress = currentAddress;
          }
        },
      );
    } catch (e) {
      log('error found');
      log(e.toString());
    }
    for (var data in allAddress) {
      log(data.toMap().toString());
    }
    return allAddress;
  }

  static Future getCurrentSelectedAddress() async {
    AddressModel defaultAddressModel = AddressModel();
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Adress')
          .doc(auth.currentUser!.email)
          .collection('address')
          .get();
      snapshot.docs.forEach(
        (element) {
          AddressModel currentAddress = AddressModel.fromMap(element.data());
          if (currentAddress.isDefault == true) {
            defaultAddressModel = currentAddress;
          }
        },
      );
    } catch (e) {
      log('error found');
      log(e.toString());
    }
    return defaultAddressModel;
  }
}

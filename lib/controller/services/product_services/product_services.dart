import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:store/constant/common_functions.dart';
import 'package:store/constant/constants.dart';
import 'package:store/controller/provider/product_provider/product_provider.dart';
import 'package:store/main.dart';
import 'package:store/model/product_model.dart';
import 'package:uuid/uuid.dart';

class ProductServices {
  static Future getImage({required BuildContext context}) async {
    List<File> selectImages = [];
    final PickedFile = await picker.pickMultiImage(
      imageQuality: 100,
    );
    List<XFile> filePick = PickedFile;

    if (filePick.isNotEmpty) {
      for (var i = 0; i < filePick.length; i++) {
        selectImages.add(File(filePick[i].path));
      }
    } else {
      CommonFunctions.showToast(context: context, message: 'No Image Selected');
    }
    log('The Images are \n${selectImages.toList().toString()}');
    return selectImages;
  }

  static uplodeImageToFirebase(
      {required List<File> Images, required BuildContext context}) async {
    List<String> imagesURL = [];
    String sellerUID = auth.currentUser!.email!;
    Uuid uuid = const Uuid();
    await Future.forEach(
      Images,
      (image) async {
        String imageName = '$sellerUID${uuid.v1().toString()}';
        Reference ref = storage.ref().child('Product_Images').child(imageName);
        await ref.putFile(File(image.path));
        String imageURL = await ref.getDownloadURL();
        imagesURL.add(imageURL);
      },
    );
    context.read<SellerProductProvider>().updateImagesURL(imagesURL: imagesURL);
  }

  static Future addProduct({
    required BuildContext context,
    required ProductModel productModel,
  }) async {
    try {
      await firestore
          .collection('Products')
          .doc(productModel.productID)
          .set(productModel.toMap())
          .whenComplete(() {
        log('Data Added');
        Navigator.pop(context);
        CommonFunctions.showToast(
          context: context,
          message: 'Product Added Successful',
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
}

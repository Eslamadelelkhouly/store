import 'dart:io';

import 'package:flutter/material.dart';
import 'package:store/controller/services/product_services/product_services.dart';
import 'package:store/model/product_model.dart';

class SellerProductProvider extends ChangeNotifier {
  List<File> productImages = [];
  List<String> productImageURL = [];
  List<ProductModel> products = [];
  bool sellerProductsFetched = false;

  fetchProductImagesFromGallery({required BuildContext context}) async {
    productImages = await ProductServices.getImage(context: context);
    notifyListeners();
  }

  updateImagesURL({required List<String> imagesURL}) async {
    productImageURL = imagesURL;
    notifyListeners();
  }

}

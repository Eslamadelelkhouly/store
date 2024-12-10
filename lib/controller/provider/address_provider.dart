import 'package:flutter/material.dart';
import 'package:store/controller/services/user_data_crud_services/user_data_CRUD_services.dart';
import 'package:store/model/address_model.dart';

class AddressProvider extends ChangeNotifier {
  List<AddressModel> allAddressModel = [];
  AddressModel currentSelectedAddress = AddressModel();
  bool fetchedCurrentSelectedAddress = false;
  bool fetchedAllAddress = false;
  bool addressPresent = false;

  getAllAddress() async {
    allAddressModel = await UserDataCRUD.getAllAddress();
    fetchedAllAddress = true;
    notifyListeners();
  }

  getCurrentSelectedAddress() async {
    currentSelectedAddress = await UserDataCRUD.getCurrentSelectedAddress();
    addressPresent = await UserDataCRUD.checkUserAdress();
    fetchedCurrentSelectedAddress = true;
    notifyListeners();
  }
}

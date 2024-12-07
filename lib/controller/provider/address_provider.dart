import 'package:flutter/material.dart';
import 'package:store/controller/services/user_data_crud_services/user_data_CRUD_services.dart';
import 'package:store/model/address_model.dart';

class AddressProvider extends ChangeNotifier {
  List<AddressModel> allAddressModel = [];
  AddressModel currentSelectedAddress = AddressModel();

  getAllAddress() async {
    allAddressModel = await UserDataCRUD.getAllAddress();
    notifyListeners();
  }

  getCurrentSelectedAddress() async {
    currentSelectedAddress = await UserDataCRUD.getCurrentSelectedAddress();
  }
}

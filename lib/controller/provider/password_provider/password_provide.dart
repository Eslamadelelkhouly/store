import 'package:flutter/material.dart';

class PasswordProvide extends ChangeNotifier {
  bool obcure = true;
  Icon icon = const Icon(Icons.visibility_off);

  void clickpassword() {
    obcure = !obcure;
    icon = obcure
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);
    notifyListeners();
  }
}

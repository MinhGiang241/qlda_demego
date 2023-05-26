import 'package:flutter/material.dart';

class AuthPrv extends ChangeNotifier {
  bool remember = true;

  toggleRemember() {
    remember = !remember;
    notifyListeners();
  }
}

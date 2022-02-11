import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int counter = 0;

  void increase() {
    counter++;
    notifyListeners();
  }
}

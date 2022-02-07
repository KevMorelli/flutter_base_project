import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier {
  int counter = 0;

  void increase() {
    counter++;
    notifyListeners();
  }
}

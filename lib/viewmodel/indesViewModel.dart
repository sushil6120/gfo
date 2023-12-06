import 'package:flutter/material.dart';

class IndexViewModel with ChangeNotifier {
  int indexs = 0;

  setIndexs(int value) {
    indexs = value;
    notifyListeners();
  }
}

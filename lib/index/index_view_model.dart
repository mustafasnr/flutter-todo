import 'package:flutter/material.dart';

class IndexViewModel extends ChangeNotifier {
  List<String> todos = [];
  var icons = [
    "assets/svg/home.svg",
    "assets/svg/calendar.svg",
    "assets/svg/focuse.svg",
    "assets/svg/profile.svg",
  ];
  var labels = ["Home", "Calendar", "Focuse", "Profile"];
  int index = 0;
  void setIndex(int value) {
    index = value;
    notifyListeners();
  }
}

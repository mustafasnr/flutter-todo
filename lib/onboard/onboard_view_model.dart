import 'package:flutter/material.dart';

class OnboardViewModel extends ChangeNotifier {
  List<String> assets = [
    "assets/svg/onboard_1.svg",
    "assets/svg/onboard_2.svg",
    "assets/svg/onboard_3.svg",
  ];
  // var sizes = [(213, 277), (271, 296), (257, 251)];
  int index = 0;
  var context = [
    [
      "Manage your tasks",
      "You can easily manage all of your daily task in DoMe for free"
    ],
    [
      "Create daily routine",
      "In Uptodo  you can create your personalized routine to stay productive"
    ],
    [
      "Orgonaize your tasks",
      "You can organize your daily tasks by adding your tasks into separate categories"
    ]
  ];
  void setIndex(int value) {
    index = value;
    notifyListeners();
  }
}

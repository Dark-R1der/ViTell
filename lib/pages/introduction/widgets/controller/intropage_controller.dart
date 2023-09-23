import 'package:chatbot/pages/introduction/introPage.dart';
import 'package:flutter/material.dart';

class IntroPageController with ChangeNotifier {
  int pageIndex = 0;
  final List<Widget> screens = [
    const IntroPage0(),
    const IntroPage1(),
    const IntroPage2(),
  ];

  void newScreenIndex(int newScreenIndex) {
    pageIndex = newScreenIndex;
    notifyListeners();
  }
}

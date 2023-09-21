import 'dart:collection';
import 'package:flutter/foundation.dart';

class OrganisationPageController with ChangeNotifier {
  int selectedIndex = 0;
  void changeSelectedIndex(int newIndex) {
    selectedIndex = newIndex;
    notifyListeners();
  }
}

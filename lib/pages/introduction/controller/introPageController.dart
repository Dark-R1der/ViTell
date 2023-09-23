import 'package:flutter/foundation.dart';

class PageIndex with ChangeNotifier {
  int pageIndex = 0;
  String password = "";
  void changePassword(String newPassword) {
    password = newPassword;
    notifyListeners();
  }

  void chagnePageIndex() {
    pageIndex += 1;
    notifyListeners();
  }
}

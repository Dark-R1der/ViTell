import 'package:flutter/foundation.dart';

class PageIndex with ChangeNotifier {
  int pageIndex = 0;
  void chagnePageIndex() {
    pageIndex += 1;
    notifyListeners();
  }
}

import 'package:flutter/foundation.dart';

class NewsController with ChangeNotifier {
  var centerSliderIndex = 0;
  void changeCenterSliderIndex(int index) {
    centerSliderIndex = index;
    notifyListeners();
  }
}

import 'dart:collection';

import 'package:chatbot/pages/chat/chat.dart';
import 'package:chatbot/pages/organisation/organisationPage.dart';
import 'package:chatbot/pages/saved/savedChats.dart';
import 'package:flutter/material.dart';

class HomePageController with ChangeNotifier {
  int pageIndex = 1;
  final List<Widget> screens = [
    const OrganisationPage(),
    const ChatPage(),
    const SavedChats(),
  ];

  void newScreenIndex(int newScreenIndex) {
    pageIndex = newScreenIndex;
    notifyListeners();
  }
}

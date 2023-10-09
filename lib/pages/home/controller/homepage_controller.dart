import 'dart:collection';

import 'package:chatbot/pages/chat/chat.dart';
import 'package:chatbot/pages/notification/notification.dart';
import 'package:chatbot/pages/organisation/organisationPage.dart';
import 'package:chatbot/pages/saved/savedChats.dart';
import 'package:chatbot/utils/logger.dart';
import 'package:flutter/material.dart';

class HomePageController with ChangeNotifier {
  int pageIndex = 3;
  final List<Widget> screens = [
    const SavedChats(),
    const NotificationPage(),
    const ChatPage(),
    const SavedChats(),
    const SavedChats()
  ];

  void newScreenIndex(int newScreenIndex) {
    pageIndex = newScreenIndex;
    Logger.logA(pageIndex.toString());
    notifyListeners();
  }
}

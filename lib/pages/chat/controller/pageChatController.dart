import 'dart:collection';
import 'package:chatbot/pages/chat/model/chatMessages.dart';
import 'package:chatbot/utils/logger.dart';
import 'package:flutter/foundation.dart';

class PageChatController with ChangeNotifier {
  String title = "ChatBOT_AI";
  bool isEmpty = true;
  List<ChatMessage> messages = [];
  bool isLoading = false;
  void changeStatus() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void titleChange(String newTitle) {
    title = newTitle;
    Logger.logA(newTitle);
    notifyListeners();
  }

  void addMessage({required String text, required bool isSender}) {
    ChatMessage message = ChatMessage(text, isSender);
    messages.add(message);
    notifyListeners();
  }

  void changeIsEmpty() {
    isEmpty = !isEmpty;
    notifyListeners();
  }
}

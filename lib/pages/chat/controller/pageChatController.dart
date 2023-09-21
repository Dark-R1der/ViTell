import 'dart:collection';
import 'package:chatbot/pages/chat/model/chatMessages.dart';
import 'package:flutter/foundation.dart';

class PageChatController with ChangeNotifier {
  bool isEmpty = true;
  List<ChatMessage> messages = [];

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

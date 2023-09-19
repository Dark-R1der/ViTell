import 'dart:collection';
import 'package:chatbot/pages/chat/model/chatMessages.dart';
import 'package:flutter/foundation.dart';

class PageChatController with ChangeNotifier {
  bool isEmpty = true;
  List<ChatMessage> messages = [];
  void checkAdd() {
    ChatMessage message1 = ChatMessage("Hello, there!", true);
    messages.add(message1);
    ChatMessage message2 = ChatMessage("Hi, how can I help you?", false);
    messages.add(message2);
    ChatMessage message3 = ChatMessage("Hello, there!", true);
    messages.add(message3);
    ChatMessage message4 = ChatMessage("Hi, how can I help you?", false);
    messages.add(message4);
    ChatMessage message5 = ChatMessage("Hello, there!", true);
    messages.add(message5);
    ChatMessage message6 = ChatMessage("Hi, how can I help you?", false);
    messages.add(message6);
  }

  void addMessage(String text, bool isSender) {
    ChatMessage message = ChatMessage(text, isSender);
    messages.add(message);
  }

  void changeIsEmpty() {
    isEmpty = !isEmpty;
    notifyListeners();
  }
}

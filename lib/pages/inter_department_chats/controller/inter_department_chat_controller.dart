import 'package:chatbot/pages/chat/model/chatMessages.dart';
import 'package:flutter/material.dart';

class InterDepartmentChatController with ChangeNotifier {
  List<ChatMessage> messages = [
    ChatMessage("fuck you ", true),
    ChatMessage("fuck you ", false),
    ChatMessage("fuck you ", true),
    ChatMessage("fuck you ", false),
    ChatMessage("fuck you ", true),
    ChatMessage("fuck you ", false),
    ChatMessage("fuck you ", true),
    ChatMessage("fuck you ", false),
    ChatMessage("fuck you ", true),
    ChatMessage("fuck you ", false),
    ChatMessage("fuck you ", true),
    ChatMessage("fuck you ", false),
    ChatMessage("fuck you ", false),
    ChatMessage("fuck you ", false),
    ChatMessage("fuck you ", false),
  ];

  void addChatMessages({required String text, required  bool isSender}) {
    ChatMessage temp = ChatMessage(text, isSender);
    messages.add(temp);
    notifyListeners();
  }
}

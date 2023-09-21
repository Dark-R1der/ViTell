import 'dart:collection';
import 'package:chatbot/pages/chat/chattingPage.dart';
import 'package:chatbot/pages/chat/emptyChat.dart';
import 'package:chatbot/pages/chat/model/chatMessages.dart';
import 'package:chatbot/pages/chat/model/chatTile.dart';
import 'package:chatbot/pages/chat/previousChat.dart';
import 'package:chatbot/utils/logger.dart';
import 'package:flutter/foundation.dart';

class PageChatController with ChangeNotifier {
  String title = "ChatBOT_AI";
  bool isEmpty = true;
  List<ChatMessage> messages = [];
  bool isLoading = false;
  List<ChatTile> chat = [];
  int page = 0;
  var screenList = [
    const EmptyChat(),
    const ChattingPage(),
    const PreviousChat(),
  ];

  void pageNewIndex({required int newIndex}) {
    page = newIndex;
    notifyListeners();
  }

  void addChat({required List<ChatMessage> messages, required String title}) {
    ChatTile temp = ChatTile(messages: messages, title: title);
    chat.add(temp);
    notifyListeners();
  }

  void removeChat({required int removeIndex}) {
    chat.removeAt(removeIndex);
    if (chat.isEmpty) {
      pageNewIndex(newIndex: 0);
    }
    notifyListeners();
  }

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

  void emptyMessage() {
    title = "New Chat";
    messages.clear();
    notifyListeners();
  }
}

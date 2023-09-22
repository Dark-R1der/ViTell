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
  List<ChatMessage> messagesCon = [];
  bool isLoading = false;
  List<ChatTile> chatFull = [];
  List<ChatTile> chatFullSave = [];
  int page = 0;
  int iconIndex = 0;
  var screenList = [
    const EmptyChat(),
    const ChattingPage(),
    const PreviousChat(),
  ];

  void addSavedChats(
      {required List<ChatMessage> messages, required String title}) {
    ChatTile temp = ChatTile(
        id: DateTime.now().toString(), messages: messages, title: title);
    chatFullSave.add(temp);
    print(chatFullSave[0].messages[0].text);
    notifyListeners();
    title = "New Chat";
    // messagesCon.clear();
  }

  void changeIconIndex(int newIconIndex) {
    iconIndex = newIconIndex;
    notifyListeners();
  }

  void pageNewIndex({required int newIndex}) {
    page = newIndex;
    notifyListeners();
  }

  void addChat({required List<ChatMessage> messages, required String title}) {
    // Logger.logH(messages[0].text);
    ChatTile temp = ChatTile(
        id: DateTime.now().toString(), messages: messages, title: title);
    chatFull.add(temp);
    // Logger.logA(chatFull[0].messages[0].text);
    print(chatFull[0].messages[0].text);
    notifyListeners();
    title = "New Chat";
    // messagesCon.clear();
  }

  void removeChat({required int removeIndex}) {
    chatFull.removeAt(removeIndex);
    if (chatFull.isEmpty) {
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
    // Logger.logA(newTitle);
    notifyListeners();
  }

  void addMessage({required String text, required bool isSender}) {
    ChatMessage message = ChatMessage(text, isSender);
    messagesCon.add(message);
    notifyListeners();
  }

  void changeIsEmpty() {
    isEmpty = !isEmpty;
    notifyListeners();
  }

  void emptyMessage() {
    title = "New Chat";
    // messages.clear();
    notifyListeners();
  }
}

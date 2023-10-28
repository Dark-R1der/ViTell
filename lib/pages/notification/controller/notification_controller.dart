import 'dart:convert';

import 'package:chatbot/pages/chat/model/chatMessages.dart';
import 'package:chatbot/pages/notification/model/noti_model.dart';
import 'package:chatbot/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationController with ChangeNotifier {
  List<NotificationModel> notificationList = [];

  void printNotitic() async {
    await loadNotificationData();
  }

  Future<void> loadNotificationData() async {
    try {
      String data =
          await rootBundle.loadString('assets/jsons/notification.json');
      List<dynamic> jsonData = json.decode(data);

      for (int i = 0; i < jsonData.length; i++) {
        List<ChatMessage> messages = [];
        if (jsonData[i]["Messages"] != null) {
          for (var message in jsonData[i]["Messages"]) {
            print("message: ${message["message"]}");
            messages.add(ChatMessage(message["message"], message["isSender"]));
          }
        }
        NotificationModel temp = NotificationModel(
          title: jsonData[i]["Name"],
          imageUrl: jsonData[i]["Image"],
          messages: messages,
        );
        notificationList.add(temp);
      }
      Logger.logH("${notificationList[0].title}");
      notifyListeners();
    } catch (e, stackTrace) {
      // Logger.logE("Error: $e, StackTrace: $stackTrace");
    }
  }
}

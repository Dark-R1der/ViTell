import 'package:chatbot/pages/chat/model/chatMessages.dart';

class NotificationModel {
  String title;
  String imageUrl;
  List<ChatMessage> messages;
  NotificationModel(
      {required this.title, required this.imageUrl, required this.messages});
}

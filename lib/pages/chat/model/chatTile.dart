import 'package:chatbot/pages/chat/model/chatMessages.dart';

class ChatTile {
  String id;
  List<ChatMessage> messages;
  String title = "GovBuddy";
  ChatTile({
    required this.id,
    required this.messages,
    required this.title,
  });
}

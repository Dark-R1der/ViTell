import 'package:chatbot/pages/chat/model/chatMessages.dart';

class ChatTile {
  String id;
  List<ChatMessage> messages;
  String title = "ChatBOT_AI";
  ChatTile({
    required this.id,
    required this.messages,
    required this.title,
  });
}

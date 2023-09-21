import 'package:chatbot/pages/chat/model/chatMessages.dart';

class ChatTile {
  List<ChatMessage> messages = [];
  String title = "ChatBOT_AI";
  ChatTile({
    required this.messages,
    required this.title,
  });
}

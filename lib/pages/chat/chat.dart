import 'package:chatbot/pages/chat/chattingPage.dart';
import 'package:chatbot/pages/chat/controller/pageChatController.dart';
import 'package:chatbot/pages/chat/emptyChat.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<PageChatController>(builder: (context, data, child) {
          return data.isEmpty ? EmptyChat() : ChattingPage();
        }),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(bottom: 12.0, right: 18, left: 18, top: 20),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Ask me anything...",
                    hintStyle: const TextStyle(
                      color: Color(0xFF9E9E9E),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          child: Image.asset("assets/icons/scan.png"),
                          onPressed: () {
                            // Add your action for the first icon here
                          },
                        ),
                        TextButton(
                          child: Image.asset("assets/icons/mic.png"),
                          onPressed: () {
                            // Add your action for the second icon here
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Consumer<PageChatController>(builder: (context, data, child) {
                return InkWell(
                  onTap: () {
                    data.changeIsEmpty();
                    data.checkAdd();
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: const Color(0xFF17C3CE),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 4,
                              color: Color(0xFF17C3CE),
                              offset: Offset(0, 2))
                        ]),
                    child: Center(
                      child: Image.asset("assets/icons/arrow_button.png"),
                    ),
                  ),
                );
              }),
            ],
          ),
        ));
  }
}

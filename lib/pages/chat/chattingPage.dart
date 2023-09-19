import 'package:chatbot/pages/chat/controller/pageChatController.dart';
import 'package:chatbot/pages/chat/model/chatMessages.dart';
import 'package:chatbot/pages/chat/widget/messageTile.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Consumer<PageChatController>(
            builder: (context, data, child) {
              return Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 18, right: 18),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemCount:
                        data.messages.length, // Number of items in the list
                    itemBuilder: (BuildContext context, int index) {
                      return MessageTile(message: data.messages[index]);
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

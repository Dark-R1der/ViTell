import 'package:chatbot/pages/chat/controller/pageChatController.dart';
import 'package:chatbot/pages/chat/widget/messageTile.dart';
import 'package:chatbot/utils/threedot.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<PageChatController>(builder: (context, data, child) {
      return Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 18, right: 18),
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount:
                    data.messages.length + 1, // Add 1 for the extra widget
                itemBuilder: (BuildContext context, int index) {
                  if (index == data.messages.length) {
                    return data.isLoading
                        ? const ThreeDots()
                        : const SizedBox();
                  } else {
                    return MessageTile(message: data.messages[index]);
                  }
                },
              ),
            ),
          )
        ],
      );
    }));
  }
}

import 'package:chatbot/pages/chat/chat.dart';
import 'package:chatbot/pages/chat/controller/pageChatController.dart';
import 'package:chatbot/pages/chat/widget/messageTile.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:chatbot/utils/threedot.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Consumer<PageChatController>(
            builder: (context, data, child) {
              return IconButton(
                onPressed: () {
                  data.addChat(
                    messages: data.messages,
                    title: data.title,
                  );
                  data.emptyMessage();
                  data.pageNewIndex(newIndex: 2);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              );
            },
          ),

          // backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Consumer<PageChatController>(
            builder: (context, data, child) {
              return Center(
                child: txt(
                  data.title,
                  size: 26,
                  weight: FontWeight.w400,
                ),
              );
            },
          ),
          actions: [
            Consumer<PageChatController>(
              builder: (context, data, child) {
                return InkWell(
                  onTap: () {
                    data.addChat(
                      messages: data.messages,
                      title: data.title,
                    );
                    data.emptyMessage();
                  },
                  child: const CircleAvatar(
                    backgroundColor: Color(
                      0xFF62b6cb,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              width: 18,
            )
          ],
        ),
        body: Consumer<PageChatController>(builder: (context, data, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 18, right: 18),
            child: Column(
              children: [
                Expanded(
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
                )
              ],
            ),
          );
        }));
  }
}

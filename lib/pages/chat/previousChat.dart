import 'package:chatbot/pages/chat/controller/pageChatController.dart';
import 'package:chatbot/pages/chat/widget/previous_chat_tile.dart';
import 'package:chatbot/utils/logger.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreviousChat extends StatefulWidget {
  const PreviousChat({super.key});

  @override
  State<PreviousChat> createState() => _PreviousChatState();
}

class _PreviousChatState extends State<PreviousChat> {
  List<String> items = List.generate(10, (index) => 'Item $index');
  @override
  Widget build(BuildContext context) {
    String title = "Title 1";
    String message =
        "Message 1 Hello how are you hope you are doing file please fuck off as soon as possible kindly fuck";

    // double _positionX = 0.0;
    double sizeH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Consumer<PageChatController>(
          builder: (context, data, child) {
            return Center(
              child: txt(
                "History",
                size: 26,
                weight: FontWeight.w400,
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 18,
          left: 18,
        ),
        child: Column(
          children: [
            Consumer<PageChatController>(
              builder: (context, data, child) {
                return SizedBox(
                  height: sizeH - 261,
                  width: double.infinity,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemCount: data.chatFull.length,
                    itemBuilder: (context, index) {
                      final item = data.chatFull[index].title;
                      return InkWell(
                        onTap: () {
                          // Logger.logA("${data.chatFull[0].messages[0].text}");
                          // for (int i = 0; i < data.chatFull.length; i++) {
                          //   for (int j = 0;
                          //       j < data.chatFull[i].messages.length;
                          //       j++) {
                          //     Logger.logH(
                          //         "${data.chatFull[i].messages[j].text}");
                          //     data.addMessage(
                          //         isSender:
                          //             data.chatFull[i].messages[j].isSender,
                          //         text: data.chatFull[i].messages[j].text);
                          //   }
                          // }
                          // print(data.messagesCon);
                          data.pageNewIndex(newIndex: 1);
                        },
                        child: Dismissible(
                          key: Key(item), // Unique key for each item
                          onDismissed: (direction) {
                            setState(() {
                              data.chatFull.removeAt(index);
                              // Check if the list is empty and update the current page index if needed
                              if (data.chatFull.isEmpty) {
                                data.pageNewIndex(newIndex: 0);
                              }
                            });
                          },
                          background: Container(
                            // color: Colors.red, // Background color when swiping
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20.0),
                            // color: Colors.red, // Background color when swiping
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xFFF5F5F5),
                            ),
                            child: ListTile(
                              title: txt(
                                data.chatFull[index].title,
                                weight: FontWeight.w600,
                                size: 0.026 * sizeH,
                                textAlign: TextAlign.left,
                              ),
                              subtitle: txt(
                                message,
                                size: 0.014 * sizeH,
                                textAlign: TextAlign.left,
                                color: const Color(0xFFBBBBBB),
                                maxLine: 2,
                              ),
                              trailing: const IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

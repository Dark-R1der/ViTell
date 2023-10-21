import 'package:chatbot/pages/chat/controller/pageChatController.dart';
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
        "Hello hope you are doing fine today? I am AI an model so I don't feel any emotion";

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
                      return Dismissible(
                        key: Key(item), // Unique key for each item
                        onDismissed: (direction) {
                          setState(() {
                            if (direction == DismissDirection.startToEnd) {
                              // Handle left swipe (remove from list or add to saved chats)
                              data.addSavedChats(
                                messages: data.chatFull[index].messages,
                                title: data.chatFull[index].title,
                              );
                              data.chatFull.removeAt(index);
                              Logger.logA("Code removed");
                            } else if (direction ==
                                DismissDirection.endToStart) {
                              // Handle right swipe (remove from list)
                              data.chatFull.removeAt(index);
                              Logger.logA("Code saved");
                            }

                            // Check if the list is empty and update the page index accordingly
                            if (data.chatFull.isEmpty) {
                              data.pageNewIndex(newIndex: 0);
                            } else {
                              data.pageNewIndex(newIndex: 2);
                            }
                          });
                        },
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
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
                              ),
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

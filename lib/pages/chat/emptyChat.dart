import 'package:chatbot/pages/chat/controller/pageChatController.dart';
import 'package:chatbot/services/backEnd.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmptyChat extends StatelessWidget {
  const EmptyChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> sampleText = [
      "Could you list the task that you can do",
      "How to write a letter",
      "Give me a pro and cons list of purchasing a PC within 100 people",
    ];
    BackendServices backendServices = BackendServices();
    return Consumer<PageChatController>(
      builder: (context, data, child) {
        return Scaffold(
          appBar: AppBar(
            leading: data.chatFull.isNotEmpty
                ? IconButton(
                    onPressed: () => data.pageNewIndex(newIndex: 2),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  )
                : null,
            // backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title:
                Consumer<PageChatController>(builder: (context, data, child) {
              return Center(
                child: txt(
                  data.title,
                  size: 26,
                  weight: FontWeight.w400,
                ),
              );
            }),
            actions: [
              data.chatFull.isNotEmpty
                  ? const InkWell(
                      onTap: null,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, right: 18, left: 18, bottom: 15),
            child: Column(
              children: [
                SizedBox(
                    height: 160,
                    width: 160,
                    child: Image.asset("assets/vectorImages/robotAvatar.png")),
                const SizedBox(
                  height: 20,
                ),
                txt("ChatBot AI", color: Colors.grey.shade600, size: 30),
                const SizedBox(
                  height: 20,
                ),
                Consumer<PageChatController>(builder: (context, data, child) {
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount:
                          sampleText.length, // Number of items in the list
                      itemBuilder: (BuildContext context, int index) {
                        // Create a ListTile for each item in the list
                        return InkWell(
                          onTap: () async {
                            data.pageNewIndex(newIndex: 1);
                            String textTobeSent = sampleText[index];
                            data.changeStatus();
                            data.addMessage(text: textTobeSent, isSender: true);
                            var responseText = await backendServices.openAI(
                                text: textTobeSent);
                            responseText = responseText.replaceAll('\n\n', "");
                            // Logger.logA("${responseText}");
                            data.addMessage(
                              text: responseText,
                              isSender: false,
                            );
                            data.changeStatus();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(25),
                            width: double.infinity,
                            // height: 40,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(10)),
                            child: txt(
                              sampleText[index],
                              color: const Color(0xFF9E9E9E),
                              size: 16,
                              weight: FontWeight.w400,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
                txt(
                  "This is example that what can I do fo",
                  color: const Color(0xFF9E9E9E),
                  size: 16,
                  weight: FontWeight.w400,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

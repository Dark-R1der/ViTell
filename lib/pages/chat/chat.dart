import 'package:chatbot/pages/chat/controller/pageChatController.dart';
import 'package:chatbot/serives/backEnd.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    BackendServices backendServices = BackendServices();
    double sizeH = MediaQuery.of(context).size.height;
    double sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Consumer<PageChatController>(builder: (context, data, child) {
        return data.screenList[data.page];
      }),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: 12.0, right: 18, left: 18, top: 20),
        child: Consumer<PageChatController>(
          builder: (context, data, child) {
            return (data.page == 2)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          data.pageNewIndex(newIndex: 0);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          width: 0.3 * sizeW,
                          height: 0.05 * sizeH,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xFF17C3CE),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 0.01 * sizeW,
                              ),
                              txt("New Chat",
                                  size: 14,
                                  color: Colors.white,
                                  weight: FontWeight.w600),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      // ThreeDots(),
                      Expanded(
                        child: TextField(
                          controller: textEditingController,
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
                      Consumer<PageChatController>(
                          builder: (context, data, child) {
                        return InkWell(
                          onTap: () async {
                            data.pageNewIndex(newIndex: 1);
                            String textTobeSent = textEditingController.text;
                            textEditingController.clear();
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
                            String titlePass = data.messagesCon[0].text +
                                "Give me a title related to the question here it should be only two words.";
                            var responseTitle = await backendServices.openAI(
                              text: titlePass,
                            );
                            responseTitle =
                                responseTitle.replaceAll('\n\n', "");
                            responseTitle = responseTitle.substring(
                                1, responseTitle.length - 1);
                            data.titleChange(responseTitle);
                            responseText = responseText.replaceAll('\n\n', "");
                            data.changeStatus();
                            // Logger.logA(responseText.toString());
                            // data.changeIsEmpty();
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
                              child:
                                  Image.asset("assets/icons/arrow_button.png"),
                            ),
                          ),
                        );
                      }),
                    ],
                  );
          },
        ),
      ),
    );
  }
}

import 'package:chatbot/pages/chat/model/chatMessages.dart';
import 'package:chatbot/pages/chat/widget/messageTile.dart';
import 'package:chatbot/pages/inter_department_chats/controller/inter_department_chat_controller.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InterDepartmentChatPage extends StatefulWidget {
  const InterDepartmentChatPage({super.key});

  @override
  State<InterDepartmentChatPage> createState() =>
      _InterDepartmentChatPageState();
}

class _InterDepartmentChatPageState extends State<InterDepartmentChatPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          children: [
            Container(
              height: 40,
              width: 30,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const CircleAvatar(
              maxRadius: 25,
              minRadius: 25,
              backgroundColor: Colors.black,
            ),
            const SizedBox(
              width: 5,
            ),
            txt(
              "Department Name",
              weight: FontWeight.w500,
              size: 24,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          left: 10,
          right: 10,
        ),
        child: Stack(
          children: [
            Consumer<InterDepartmentChatController>(
              builder: (context, page, child) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 20),
                  itemCount: page.messages.length + 1,
                  itemBuilder: (context, index) {
                    if (index == page.messages.length) {
                      return Container(height: 80);
                    }
                    return MessageTile(message: page.messages[index]);
                  },
                );
              },
            ),
            Positioned(
                bottom: 10,
                child: Container(
                  // height: 100,
                  width: 320,
                  // color: Colors.amber,
                  child: TextField(
                    // controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: "Your message...",
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
                )),
            Positioned(
                bottom: 15,
                right: 10,
                child: SizedBox(
                  height: 55,
                  width: 55,
                  child: Consumer<InterDepartmentChatController>(
                      builder: (context, data, child) {
                    return InkWell(
                      onTap: () async {},
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: const Color.fromARGB(255, 13, 90, 96),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: Color.fromARGB(255, 13, 90, 96),
                                  offset: Offset(0, 2))
                            ]),
                        child: Center(
                          child: Image.asset("assets/icons/arrow_button.png"),
                        ),
                      ),
                    );
                  }),
                ))
          ],
        ),
      ),
    );
  }
}

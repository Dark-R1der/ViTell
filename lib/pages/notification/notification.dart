import 'dart:convert';

import 'package:chatbot/pages/chat/model/chatMessages.dart';
import 'package:chatbot/pages/inter_department_chats/inter_department_chat_page.dart';
import 'package:chatbot/pages/notification/controller/notification_controller.dart';
import 'package:chatbot/pages/notification/model/noti_model.dart';
import 'package:chatbot/utils/appSizeUtil.dart';
import 'package:chatbot/utils/colorData.dart';
import 'package:chatbot/utils/logger.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> notificationList = [];
  Future<void> loadNotificationData() async {
    try {
      String data =
          await rootBundle.loadString('assets/jsons/notification.json');
      List<dynamic> jsonData = json.decode(data);
      // Logger.logA("message: ${jsonData[0]["Message"][0]["message"]}");
      for (int i = 0; i < jsonData.length; i++) {
        List<ChatMessage> messages = [];
        if (jsonData[i]["Message"] != null) {
          for (var message in jsonData[i]["Message"]) {
            // print(message);
            messages.add(ChatMessage(message["message"], message["isSender"]));
          }
        }
        Logger.logA("${messages[0].text} - ${jsonData[i]["Name"]}}");
        NotificationModel temp = NotificationModel(
          title: jsonData[i]["Name"],
          imageUrl: jsonData[i]["Image"],
          messages: messages,
        );
        notificationList.add(temp);
      }
      Logger.logH("${notificationList[0].title}");
      // notifyListeners();
    } catch (e, stackTrace) {
      // Logger.logE("Error: $e, StackTrace: $stackTrace");
    }
  }

  NotificationController _notificationController = NotificationController();
  @override
  void initState() {
    _notificationController.printNotitic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: txt(
          "Notifications",
          weight: FontWeight.w500,
          size: 24,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            // txt(notificationList[0].messages[0].),
            InkWell(
              onTap: () async {
                await loadNotificationData();
                setState(() {});
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.black,
              ),
            ),
            // Consumer<NotificationController>(builder: (context, data, child) {
            // return
            Expanded(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: notificationList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        _notificationController.loadNotificationData();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InterDepartmentChatPage(
                                    departmentCommunication:
                                        notificationList[index],
                                  )),
                        );
                      },
                      child: Container(
                        height: 87,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorData.textColorGrey,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      notificationList[index].imageUrl),
                                  fit: BoxFit.cover,
                                ),
                                // color: Colors.amber,
                                borderRadius: BorderRadius.circular(55),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: w(context) * 0.6,
                                  child: txt(
                                    textAlign: TextAlign.start,
                                    notificationList[index].title,
                                    weight: FontWeight.w500,
                                    size: 18,
                                    maxLine: 1,
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: txt(
                                    notificationList[index]
                                        .messages[notificationList[index]
                                                .messages
                                                .length -
                                            1]
                                        .text
                                        .toString(),
                                    weight: FontWeight.w200,
                                    textAlign: TextAlign.start,
                                    maxLine: 2,
                                    size: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              backgroundColor: ColorData.themeColor,
                              minRadius: 15,
                              maxRadius: 15,
                              child: Center(
                                child: txt(notificationList[index]
                                    .messages
                                    .length
                                    .toString()),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              // );
            )
          ],
        ),
      ),
    );
  }
}

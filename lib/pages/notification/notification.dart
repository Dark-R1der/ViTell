import 'package:chatbot/pages/inter_department_chats/inter_department_chat_page.dart';
import 'package:chatbot/utils/colorData.dart';
import 'package:chatbot/utils/logger.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: 14,
              itemBuilder: (context, index) {
                if (index == 13) {
                  return Container(
                    height: 60,
                    width: double.infinity,
                    color: ColorData.whiteColor,
                  );
                }
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const InterDepartmentChatPage()),
                    );
                  },
                  child: Container(
                    height: 87,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorData.textColorGrey,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          minRadius: 30,
                          maxRadius: 30,
                          backgroundColor: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            txt(
                              "Department Name",
                              weight: FontWeight.w500,
                              size: 18,
                            ),
                            Container(
                              width: 250,
                              // color: Colors.amber,
                              child: txt(
                                "this is the latest message from the department hello there how are doing now a days",
                                weight: FontWeight.w200,
                                textAlign: TextAlign.start,
                                maxLine: 2,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: ColorData.themeColor,
                          minRadius: 15,
                          maxRadius: 15,
                          child: Center(
                            child: txt("5"),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}

import 'package:chatbot/pages/chat/controller/pageChatController.dart';
import 'package:chatbot/utils/loading.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedChats extends StatelessWidget {
  const SavedChats({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeH = MediaQuery.of(context).size.height;
    return Consumer<PageChatController>(
      builder: (context, data, child) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16,
          ),
          child: data.chatFullSave.isEmpty
              ? const LoaderWidget()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 726,
                      width: double.infinity,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: data.chatFullSave.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xFFF5F5F5),
                            ),
                            child: ListTile(
                              title: txt(
                                data.chatFullSave[0].title,
                                weight: FontWeight.w600,
                                size: 0.026 * sizeH,
                                textAlign: TextAlign.left,
                              ),
                              subtitle: txt(
                                data.messagesCon[index].text,
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
                          );
                        },
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}

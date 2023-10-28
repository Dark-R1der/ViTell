import 'package:chatbot/pages/chat/widget/loadingChat.dart';
import 'package:chatbot/utils/loading.dart';
import 'package:flutter/material.dart';

class RecentlyChatWidget extends StatelessWidget {
  const RecentlyChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LoaderWidget(),
      ],
    );
  }
}

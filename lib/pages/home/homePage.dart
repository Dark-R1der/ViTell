import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';

class HomeStartPage extends StatelessWidget {
  const HomeStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [txt('Welcome to ChatBot AI')],
      ),
    );
  }
}

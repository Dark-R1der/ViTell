import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  AppBarCustom({
    super.key,
    required this.titleBar,
    this.centerTitleCheck = true,
  });
  String titleBar;
  bool centerTitleCheck;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: txt(
        titleBar,
        size: 24,
        weight: FontWeight.w500,
      ),
      centerTitle: centerTitleCheck,
    );
  }
}

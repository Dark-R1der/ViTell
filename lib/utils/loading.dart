import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderWidget extends StatefulWidget {
  const LoaderWidget({super.key});

  @override
  State<LoaderWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(
          child: SpinKitRipple(
            size: 400,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(400),
                  color: index.isEven ? Color(0xFF2196F3) : Color(0xFFD0F9F9),
                ),
              );
            },
          ),
        ),
        Center(
          child: Container(
            height: 220,
            width: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(200),
            ),
          ),
        ),
        Center(
          child: SizedBox(
            height: 150,
            width: 150,
            child: Image.asset(
              "assets/vectorImages/robotAvatar.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 480,
          child: Column(
            children: [
              txt(
                "No saved Chats",
                weight: FontWeight.w500,
                size: 24,
              ),
              txt(
                "Left swipe the chatbox to add....",
                color: Colors.grey.shade500,
                // weight: FontWeight.w500,
                size: 13,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

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
    return Padding(
      padding: EdgeInsets.all(60),
      child: Column(children: [
        Center(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/vectorImages/robotAvatar.png',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                child: SpinKitRipple(
                  size: 130,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(80),
                        color: index.isEven
                            ? const Color.fromARGB(255, 25, 197, 209)
                            : const Color.fromARGB(255, 13, 90, 96),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            txt(
              "No saved Chats",
              weight: FontWeight.w500,
              size: 18,
            ),
            txt(
              "Left swipe the chatbox to add....",
              color: Colors.grey.shade500,
              // weight: FontWeight.w500,
              size: 12,
            ),
          ],
        ),
      ]),
    );
  }
}

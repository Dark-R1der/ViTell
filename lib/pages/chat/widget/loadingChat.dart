import 'package:chatbot/utils/threedot.dart';
import 'package:flutter/material.dart';

class LoadingChat extends StatelessWidget {
  const LoadingChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          height: 100,
          width: 260,
          decoration: const BoxDecoration(
            color: Color(0xFF17C3CE),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: ThreeDots(),
        ),
      ],
    );
  }
}

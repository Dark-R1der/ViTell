import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';

class EmptyChat extends StatelessWidget {
  const EmptyChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> sampleText = [
      "Could you list the task that you can do",
      "How to write a letter",
      "Give me a pro and cons list of purchasing a PC within 100 people",
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 18, left: 18, bottom: 15),
      child: Column(
        children: [
          SizedBox(
              height: 160,
              width: 160,
              child: Image.asset("assets/vectorImages/robotAvatar.png")),
          const SizedBox(
            height: 20,
          ),
          txt("ChatBot AI", color: Colors.grey.shade600, size: 30),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: sampleText.length, // Number of items in the list
              itemBuilder: (BuildContext context, int index) {
                // Create a ListTile for each item in the list
                return Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  // height: 40,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(10)),
                  child: txt(
                    sampleText[index],
                    color: const Color(0xFF9E9E9E),
                    size: 16,
                    weight: FontWeight.w400,
                  ),
                );
              },
            ),
          ),
          txt(
            "This is example that what can I do fo",
            color: const Color(0xFF9E9E9E),
            size: 16,
            weight: FontWeight.w400,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
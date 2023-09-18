import 'package:chatbot/pages/home/homePage.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';

class HomeStartPage extends StatelessWidget {
  const HomeStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0, left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Column(
              children: [
                txt(
                  'Welcome to',
                  size: 36,
                  weight: FontWeight.w400,
                  color: const Color(0xFF17C3CE),
                ),
                txt(
                  'ChatBot AI',
                  size: 36,
                  weight: FontWeight.w400,
                  color: const Color(0xFF17C3CE),
                ),
                const SizedBox(
                  height: 150,
                ),
                Image.asset("assets/vectorImages/robotAvatar.png"),
                const SizedBox(
                  height: 20,
                ),
                txt("ChatBot AI", color: Colors.grey.shade600, size: 30),
                const SizedBox(
                  height: 180,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF17C3CE),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        const BoxShadow(
                          color: Color(0xFF17C3CE), // Shadow color
                          blurRadius: 10, // Spread radius
                          offset: Offset(0, 2), // Offset of the shadow
                        ),
                      ],
                    ),
                    height: 60,
                    width: double.infinity,
                    child: Center(
                      child: txt(
                        'Start Chat',
                        isBold: true,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

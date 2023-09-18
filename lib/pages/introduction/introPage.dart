import 'package:chatbot/pages/introduction/controller/introPageController.dart';
import 'package:chatbot/pages/introduction/widgets/dots.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.21, -0.98),
          end: Alignment(-0.21, 0.98),
          colors: [Color(0xFF16C3CE), Color(0xFF16C3CE), Color(0xFF01959F)],
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 38.0, left: 18, right: 18, bottom: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: null,
                  child: txt(
                    "Skip",
                    color: Colors.white,
                    size: 20,
                    isBold: true,
                  ),
                ),
                const Icon(Icons.arrow_forward_ios,
                    size: 15, color: Colors.white),
              ],
            ),
            Consumer<PageIndex>(builder: (context, page, child) {
              int index = page.pageIndex;
              return Column(
                children: [
                  if (index == 0) IntroPage0(),
                  if (index == 1) IntroPage1(),
                  if (index == 2) IntroPage2(),
                ],
              );
            }),
            Consumer<PageIndex>(builder: (context, page, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DotsNavigation(),
                  GestureDetector(
                    onTap: () {
                      print("page changing");
                      page.chagnePageIndex();
                      if(page.pageIndex==2){
                        
                      }
                    },
                    child: CircularPercentIndicator(
                      radius: 38.0,
                      lineWidth: 1.5,
                      percent: 0.33 * (page.pageIndex + 1),
                      center: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.white,
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    ));
  }
}

class IntroPage0 extends StatelessWidget {
  const IntroPage0({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 80,
        ),
        Center(
          child: Container(
              height: 335,
              width: 335,
              child: Image.asset('assets/vectorImages/robotIntro1.png')),
        ),
        const SizedBox(
          height: 40,
        ),
        txt("Introduction to 0", isBold: true, size: 32, color: Colors.white),
        txt("ChatBot_AI", isBold: true, size: 32, color: Colors.white),
        const SizedBox(
          height: 10,
        ),
        txt("Meet Chatbot, your personal AI language model & discover the benefits of using Chatbot_AI for language tasks",
            size: 16, color: Colors.white),
        const SizedBox(
          height: 80,
        ),
      ],
    );
  }
}

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 80,
        ),
        Center(
          child: Container(
              height: 335,
              width: 335,
              child: Image.asset('assets/vectorImages/robotIntro2.png')),
        ),
        const SizedBox(
          height: 40,
        ),
        txt("Explore categories of",
            isBold: true, size: 32, color: Colors.white),
        txt("all topics", isBold: true, size: 32, color: Colors.white),
        const SizedBox(
          height: 10,
        ),
        txt("Ask question to chatbot_AI with help of different categories and get answer that you want.",
            size: 16, color: Colors.white),
        const SizedBox(
          height: 80,
        ),
      ],
    );
  }
}

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PageIndex>(builder: (context, page, child) {
      int index = page.pageIndex;
      return AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: index == 2 ? 1 : 0,
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Container(
                  height: 335,
                  width: 335,
                  child: Image.asset('assets/vectorImages/robotIntro3.png')),
            ),
            const SizedBox(
              height: 40,
            ),
            txt("Getting started with",
                isBold: true, size: 32, color: Colors.white),
            txt("ChatBot_AI", isBold: true, size: 32, color: Colors.white),
            const SizedBox(
              height: 10,
            ),
            txt("Try out different language tasks and modes.",
                size: 16, color: Colors.white),
            const SizedBox(
              height: 124,
            ),
          ],
        ),
      );
    });
  }
}

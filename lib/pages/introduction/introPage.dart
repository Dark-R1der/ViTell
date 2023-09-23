import 'package:chatbot/pages/introduction/controller/introPageController.dart';
import 'package:chatbot/pages/introduction/widgets/dots.dart';
import 'package:chatbot/pages/signUp/signIn.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
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
                      page.chagnePageIndex();
                      if (page.pageIndex == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                      }
                    },
                    child: CircularPercentIndicator(
                      radius: 38.0,
                      lineWidth: 1.5,
                      percent: (page.pageIndex >= 2)
                          ? 1
                          : 0.33 * (page.pageIndex + 1),
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
        txt("Meet", isBold: true, size: 32, color: Colors.white),
        txt(
          "GovBuddy",
          isBold: true,
          size: 32,
          color: Colors.white,
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 10,
        ),
        txt("Your personal helpdesk, here to enchance the interaction between you and other government bodies",
            size: 16, color: Colors.white, textAlign: TextAlign.left),
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
          height: 60,
        ),
        txt("Future of Collaboration",
            isBold: true,
            size: 32,
            color: Colors.white,
            textAlign: TextAlign.left),
        const SizedBox(
          height: 10,
        ),
        txt(
          "Seamlessly integrating document management, and AI-driven decision making",
          size: 16,
          color: Colors.white,
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 84,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Container(
                  height: 325,
                  width: 325,
                  child: Image.asset('assets/vectorImages/robotIntro3.png')),
            ),
            const SizedBox(
              height: 60,
            ),
            txt("Interactive Multilingual Conversion",
                isBold: true,
                size: 30,
                color: Colors.white,
                textAlign: TextAlign.left),
            const SizedBox(
              height: 15,
            ),
            txt(
              "Facilitates multilingual communication for government employees.",
              size: 16,
              color: Colors.white,
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      );
    });
  }
}

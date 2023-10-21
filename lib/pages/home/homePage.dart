import 'package:chatbot/pages/home/controller/homepage_controller.dart';
import 'package:chatbot/utils/colorData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';

// Import your controllers and pages here

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  PageController controller = PageController();
  // @override
  // void initState() {
  //   setState(() {
  //     _currentIndex = 1;
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomePageController>(
        builder: (context, data, child) {
          return Stack(children: [
            PageView.builder(
              controller: controller,
              itemCount: data.screens.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return data.screens[_currentIndex];
              },
            ),
            Positioned(
              bottom: 0,
              child: FluidNavBar(
                animationFactor: 0.5,
                icons: [
                  FluidNavBarIcon(
                      unselectedForegroundColor: ColorData.secondaryColor,
                      // svgPath: "assets/home.svg",
                      icon: Icons.corporate_fare,
                      backgroundColor: _currentIndex == 0
                          ? ColorData.themeColor
                          : ColorData.themeColor,
                      extras: {"label": "home"}),
                  FluidNavBarIcon(
                      unselectedForegroundColor: ColorData.secondaryColor,
                      // unselectedForegroundColor: Colors.red,
                      icon: Icons.notifications,
                      backgroundColor: _currentIndex == 1
                          ? ColorData.themeColor
                          : ColorData.themeColor,
                      extras: {"label": "bookmark"}),
                  FluidNavBarIcon(
                      unselectedForegroundColor: ColorData.secondaryColor,
                      icon: Icons.forum,
                      backgroundColor: _currentIndex == 2
                          ? ColorData.themeColor
                          : ColorData.themeColor,
                      extras: {"label": "partner"}),
                  FluidNavBarIcon(
                      unselectedForegroundColor: ColorData.secondaryColor,
                      // svgPath: "assets/conference.svg",
                      icon: Icons.newspaper,
                      backgroundColor: _currentIndex == 3
                          ? ColorData.themeColor
                          : ColorData.themeColor,
                      extras: {"label": "conference"}),
                  FluidNavBarIcon(
                      unselectedForegroundColor: ColorData.secondaryColor,
                      // svgPath: "assets/conference.svg",
                      icon: Icons.person,
                      backgroundColor: _currentIndex == 4
                          ? ColorData.themeColor
                          : ColorData.themeColor,
                      extras: {"label": "conference"}),
                ],
                onChange: (index) {
                  setState(() {
                    _currentIndex = index;
                    controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  });
                },
                style: const FluidNavBarStyle(
                  iconUnselectedForegroundColor: Colors.white,
                  barBackgroundColor: ColorData.themeColor,
                ),
                scaleFactor: 2,
                defaultIndex: 2,
                itemBuilder: (icon, item) => Semantics(
                  label: icon.extras!["label"],
                  child: item,
                ),
              ),
            )
          ]);
        },
      ),
    );
  }
}

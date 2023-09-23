import 'package:chatbot/pages/home/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';

// Import your controllers and pages here

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

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
          return PageView.builder(
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
          );
        },
      ),
      bottomNavigationBar: Consumer<HomePageController>(
        builder: (context, data, child) {
          return CurvedNavigationBar(
            index: _currentIndex,
            height: 55,
            backgroundColor: Colors.white,
            items: const <Widget>[
              Icon(
                Icons.dataset,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.forum,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.bookmarks,
                size: 30,
                color: Colors.white,
              ),
            ],
            color: const Color(0xFF16C3CE),
            buttonBackgroundColor: const Color.fromARGB(255, 13, 90, 96),
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                controller.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              });
            },
          );
        },
      ),
    );
  }
}

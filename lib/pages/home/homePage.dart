import 'package:chatbot/pages/organisation/organisationPage.dart';
import 'package:chatbot/pages/chat/chat.dart';
import 'package:chatbot/pages/saved/saved.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;

  final List<Widget> _screens = [
    const OrganisationPage(),
    const ChatPage(),
    const ScreenThree(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Center(
              child: txt("ChatBot AI", size: 26, weight: FontWeight.w400))),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFF4F4F4),
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF17C3CE),
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dataset),
            label: 'Organisation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmarks),
            label: 'Saved',
          ),
        ],
      ),
    );
  }
}

import 'package:chatbot/pages/chat/controller/pageChatController.dart';
import 'package:chatbot/pages/home/controller/homepage_controller.dart';
import 'package:chatbot/pages/introduction/controller/introPageController.dart';
import 'package:chatbot/pages/introduction/introPage.dart';
import 'package:chatbot/pages/news/controller/news_controller.dart';
import 'package:chatbot/pages/notification/controller/notification_controller.dart';
import 'package:chatbot/pages/organisation/controller/organisationPageController.dart';
import 'package:chatbot/utils/colorData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'pages/inter_department_chats/controller/inter_department_chat_controller.dart';

Future main() async {
  await dotenv.load(fileName: "lib/.env");
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFF16C3CE), // Set status bar color
    systemNavigationBarColor: ColorData.themeColor,
  ));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => PageIndex(),
    ),
    ChangeNotifierProvider(
      create: (context) => PageChatController(),
    ),
    ChangeNotifierProvider(
      create: (context) => OrganisationPageController(),
    ),
    ChangeNotifierProvider(
      create: (context) => NotificationController(),
    ),
    ChangeNotifierProvider(
      create: (context) => InterDepartmentChatController(),
    ),
    ChangeNotifierProvider(
      create: (context) => HomePageController(),
    ),
    ChangeNotifierProvider(
      create: (context) => NewsController(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GovBuddy',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const IntroPage(),
    );
  }
}

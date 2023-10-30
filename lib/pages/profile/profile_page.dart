import 'package:chatbot/pages/recent_chat/recent_page_widget.dart';
import 'package:chatbot/pages/saved/savedChats.dart';
import 'package:chatbot/utils/appSizeUtil.dart';
import 'package:chatbot/utils/colorData.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage();

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: txt(
          "Your Profile",
          size: 26,
          weight: FontWeight.w400,
        ),
      ),
      body: DefaultTabController(
        length: 2, // specify the number of tabs here
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  txt("Tag: 22853023",
                      size: 24, color: Colors.black, weight: FontWeight.w500),
                  const Spacer(),
                  const Icon(
                    Icons.more_vert,
                    size: 30,
                  ),
                ],
              ),
              SizedBox(
                height: h(context) * 0.02,
              ),
              Center(
                child: Container(
                  height: h(context) * 0.2,
                  width: h(context) * 0.2,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/dummy_profile_dp.jpg"),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(200),
                    color: Colors.amber,
                  ),
                ),
              ),
              SizedBox(
                height: h(context) * 0.01,
              ),
              txt(
                'Sunil Chandran',
                size: 26,
                weight: FontWeight.w400,
              ),
              SizedBox(
                height: h(context) * 0.01,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                height: h(context) * 0.035,
                width: w(context) * 0.66,
                decoration: BoxDecoration(
                  color: ColorData.textColorGrey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/vectorImages/profile_rank.png"),
                      txt("Deputy Superintendent Of Police")
                    ]),
              ),
              SizedBox(
                height: h(context) * 0.01,
              ),
              txt(
                'More Details',
                size: 12,
                color: ColorData.themeColor,
                weight: FontWeight.w500,
              ),
              SizedBox(
                height: h(context) * 0.01,
              ),
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: ColorData.themeColor,
                dividerColor: ColorData.textColorGrey,
                labelColor: ColorData.themeColor,
                unselectedLabelColor: Colors.grey.shade400,
                tabs: const [
                  Tab(
                    text: 'Saved Chats',
                  ),
                  Tab(
                    text: 'Recently Chats',
                  ),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    SavedChats(),
                    RecentlyChatWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

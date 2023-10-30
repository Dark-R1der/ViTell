import 'dart:convert';

import 'package:chatbot/pages/news/controller/news_controller.dart';
import 'package:chatbot/pages/news/model/news_model.dart';
import 'package:chatbot/utils/appSizeUtil.dart';
import 'package:chatbot/utils/colorData.dart';
import 'package:chatbot/utils/logger.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scaled_list/scaled_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewPage extends StatefulWidget {
  const NewPage(
      {
      //   required this.newsTitle,
      // required this.newsArticle,
      // required this.newsImageUrl,
      super.key});
  // List<String> newsTitle;
  // List<String> newsArticle;
  // List<String> newsImageUrl;
  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  final sampleNewLength = 10;
  final List<Color> kMixedColors = [
    const Color(0xff71A5D7),
    const Color(0xff72CCD4),
    const Color(0xffFBAB57),
    const Color(0xffF8B993),
    const Color(0xff962D17),
    const Color(0xffc657fb),
    const Color(0xfffb8457),
  ];
  List<String> photoList = [
    "https://www.hindustantimes.com/ht-img/img/2023/08/18/550x309/ANI-20230817006-0_1692392764192_1692392789439.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOZ27qGiBvonr0dHWlTRpn_G-rRVpAWoLF7w&usqp=CAU",
    "https://resize.indiatvnews.com/en/resize/newbucket/400_-/2023/04/dsa-1681814808.jpg",
    "https://www.livelaw.in/h-upload/2023/09/25/500x300_494537-gujarat-national-law-university-justice-as-supehia-justice-mr-mengdey-gujarat-high-court.webp",
    "https://cdn.zeebiz.com/sites/default/files/styles/zeebiz_850x478/public/2022/08/15/195017-police-ians.png?itok=491PdtVs",
  ];

  final List<Category> categories = [
    Category(image: "assets/images/1.png", name: "Beef"),
    Category(image: "assets/images/2.png", name: "Chicken"),
    Category(image: "assets/images/3.png", name: "Dessert"),
    Category(image: "assets/images/4.png", name: "Lamb"),
    Category(image: "assets/images/5.png", name: "Pasta"),
  ];
  List<NewsModel> newsTop = [];
  List<NewsModel> newsHead = [];
  void loadNewsFromJson() async {
    String data = await rootBundle.loadString('assets/jsons/news.json');
    List<dynamic> jsonData = json.decode(data);
    for (int i = 0; i < jsonData.length; i++) {
      NewsModel temp = NewsModel(
        title: jsonData[i]['title'].toString(),
        fullDes: jsonData[i]['full_news'].toString(),
        image: jsonData[i]['image'].toString(),
        shortDes: jsonData[i]['short_description'].toString(),
      );
      if (i < 5) {
        newsTop.add(temp);
      } else {
        newsHead.add(temp);
      }
    }
    Future.delayed(const Duration(milliseconds: 500), () {
// Here you can write your code

      setState(() {
        // Here you can write your code for open new view
      });
    });
  }

  @override
  void initState() {
    loadNewsFromJson();
    // Logger.logA("${news}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: txt(
          "News",
          weight: FontWeight.w600,
          size: 26,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: sampleNewLength * 118.0 + 300.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: txt("Top News", weight: FontWeight.w500, size: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              // Container(
              //   height: 200,
              //   child: ListView.separated(
              //       separatorBuilder: (context, index) {
              //         return SizedBox(
              //           width: 20,
              //         );
              //       },
              //       itemCount: 2,
              //       itemBuilder: (context, index) {
              //         return txt(news[index].title);
              //       }),
              // ),
              Consumer<NewsController>(
                builder: (context, data, child) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 12 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 500),
                      viewportFraction: 0.8,
                      onPageChanged: (index, reason) {
                        data.changeCenterSliderIndex(index);
                      },
                    ),
                    items: newsTop
                        .map(
                          (item) => Stack(children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(item.image),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Container(
                                height: 35,
                                width: 200,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.withOpacity(0.7),
                                ),
                                child: txt(
                                  item.title,
                                  weight: FontWeight.w600,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ]),
                        )
                        .toList(),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Consumer<NewsController>(
                builder: (context, data, child) {
                  return Center(
                    child: AnimatedSmoothIndicator(
                      onDotClicked: (index) {
                        data.changeCenterSliderIndex(index);
                      },
                      activeIndex: data.centerSliderIndex,
                      count: photoList.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: ColorData.themeColor,
                        dotColor: Colors.grey,
                        dotHeight: 12,
                        dotWidth: 12,
                        spacing: 4,
                      ),
                    ),
                  );
                },
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: txt("Headlines", weight: FontWeight.w500, size: 24),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 12, left: 12),
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: newsHead.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemBuilder: (context, index) {
                      if (sampleNewLength == index) {
                        return SizedBox(
                          height: 60,
                        );
                      }
                      return Container(
                        height: 90,
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ColorData.textColorGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: w(context) * 0.74,
                                  child: txt(
                                    newsHead[index].title,
                                    maxLine: 1,
                                    weight: FontWeight.w500,
                                    size: 24,
                                  ),
                                ),
                                Container(
                                  width: 300,
                                  child: txt(
                                    newsHead[index].shortDes,
                                    weight: FontWeight.w500,
                                    maxLine: 2,
                                    // color: Col,
                                    size: 12,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    newsHead[index].image.toString(),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Category {
  final String image;
  final String name;

  Category({required this.image, required this.name});
}

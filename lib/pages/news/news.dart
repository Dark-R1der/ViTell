import 'package:chatbot/pages/news/controller/news_controller.dart';
import 'package:chatbot/utils/colorData.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';
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
              SizedBox(
                height: 10,
              ),
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
                      autoPlayAnimationDuration: Duration(milliseconds: 600),
                      viewportFraction: 0.8,
                      onPageChanged: (index, reason) {
                        data.changeCenterSliderIndex(index);
                      },
                    ),
                    items: photoList
                        .map(
                          (item) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(item), fit: BoxFit.cover),
                            ),
                          ),
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
                    itemCount: sampleNewLength + 1,
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
                                txt(
                                  "New title ${index}",
                                  weight: FontWeight.w500,
                                  size: 24,
                                ),
                                Container(
                                  width: 300,
                                  child: txt(
                                    "Some description for the news just to give a breif of what exactly is the news about and orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
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
                                    "https://www.hindustantimes.com/ht-img/img/2023/08/18/550x309/ANI-20230817006-0_1692392764192_1692392789439.jpg",
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

import 'package:chatbot/services/backEnd.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';
import 'package:scaled_list/scaled_list.dart';

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
  final List<Color> kMixedColors = [
    Color(0xff71A5D7),
    Color(0xff72CCD4),
    Color(0xffFBAB57),
    Color(0xffF8B993),
    Color(0xff962D17),
    Color(0xffc657fb),
    Color(0xfffb8457),
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
            weight: FontWeight.w500,
            size: 24,
          ),
        ),
        body: ScaledList(
        cardWidthRatio: 0.6,
          selectedCardHeightRatio: 0.29,
          unSelectedCardHeightRatio: 0.2,
          itemCount: categories.length,
          itemColor: (index) {
            return kMixedColors[index % kMixedColors.length];
          },
          itemBuilder: (index, selectedIndex) {
            final category = categories[index];
            return Container(
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text(
                    category.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: selectedIndex == index ? 25 : 20),
                  )
                ],
              ),
            );
          },
        ));

    // return Scaffold(
    //   appBar: AppBar(
    //     leading: IconButton(
    //       icon: Icon(
    //         Icons.arrow_back_ios,
    //         color: Colors.black,
    //       ),
    //       onPressed: () => Navigator.of(context).pop(),
    //     ),
    //     // backgroundColor: Colors.white,
    //     automaticallyImplyLeading: false,
    //     title: Center(
    //       child: txt("News", size: 26, weight: FontWeight.w400),
    //     ),
    //     actions: [
    //       SizedBox(
    //         width: 45,
    //       )
    //     ],
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: ListView.separated(
    //       separatorBuilder: (context, index) => SizedBox(
    //         height: 20,
    //       ),
    //       itemCount: 20,
    //       itemBuilder: (context, index) {
    //         return Container(
    //           height: 150,
    //           padding: EdgeInsets.all(20),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(20),
    //             color: Color(0xFFF5F5F5),
    //           ),
    //           child: Stack(children: [
    //             Positioned(
    //               top: 0,
    //               left: 0,
    //               child: Container(
    //                   width: 340,
    //                   child: txt(widget.newsTitle[index],
    //                       weight: FontWeight.w500,
    //                       size: 24,
    //                       textAlign: TextAlign.left,
    //                       maxLine: 1)),
    //             ),
    //             Positioned(
    //               top: 35,
    //               left: 0,
    //               child: Container(
    //                 width: 340,
    //                 child: txt(
    //                   widget.newsArticle[index],
    //                   weight: FontWeight.w500,
    //                   size: 12,
    //                   maxLine: 3,
    //                   textAlign: TextAlign.left,
    //                 ),
    //               ),
    //             ),
    //             Positioned(
    //                 // top: 0,
    //                 right: 0,
    //                 bottom: 0,
    //                 // left: 0,
    //                 child: txt(widget.newsImageUrl[index]))
    //           ]),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}

class Category {
  final String image;
  final String name;

  Category({required this.image, required this.name});
}

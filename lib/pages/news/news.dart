import 'package:chatbot/services/backEnd.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  NewPage(
      {required this.newsTitle,
      required this.newsArticle,
      required this.newsImageUrl,
      super.key});
  List<String> newsTitle;
  List<String> newsArticle;
  List<String> newsImageUrl;
  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  // BackendServices _backendServices = BackendServices();
  // late var backEndResponse;
  // List<String> titlesNew = [];
  // List<String> messageNew = [];
  // List<String> imageUrl = [];
  // @override
  // void initState() {
  //   backEndResponse = _backendServices.getNew();
  //   for (int i = 0; i < backEndResponse["totalResults"]; i++) {
  //     String data = backEndResponse["articles"][i]["title"];
  //     print(data);
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Center(
          child: txt("News", size: 26, weight: FontWeight.w400),
        ),
        actions: [
          SizedBox(
            width: 45,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              height: 150,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFF5F5F5),
              ),
              child: Stack(children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      width: 340,
                      child: txt(widget.newsTitle[index],
                          weight: FontWeight.w500,
                          size: 24,
                          textAlign: TextAlign.left,
                          maxLine: 1)),
                ),
                Positioned(
                  top: 35,
                  left: 0,
                  child: Container(
                    width: 340,
                    child: txt(
                      widget.newsArticle[index],
                      weight: FontWeight.w500,
                      size: 12,
                      maxLine: 3,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Positioned(
                    // top: 0,
                    right: 0,
                    bottom: 0,
                    // left: 0,
                    child: txt(widget.newsImageUrl[index]))
              ]),
            );
          },
        ),
      ),
    );
  }
}

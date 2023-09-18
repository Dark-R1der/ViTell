import 'package:chatbot/pages/introduction/controller/introPageController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DotsNavigation extends StatelessWidget {
  const DotsNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PageIndex>(builder: (context, page, child) {
      return Row(
        children: [
          if (page.pageIndex == 0)
            Container(
              height: 10,
              width: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          if (page.pageIndex == 0)
            SizedBox(
              width: 5,
            ),
          if (page.pageIndex == 0)
            const CircleAvatar(
              backgroundColor: Colors.white,
              maxRadius: 5,
              minRadius: 2,
            ),
          if (page.pageIndex == 0)
            SizedBox(
              width: 5,
            ),
          if (page.pageIndex == 0)
            const CircleAvatar(
              backgroundColor: Colors.white,
              maxRadius: 5,
              minRadius: 2,
            ),
          if (page.pageIndex == 1)
            const CircleAvatar(
              backgroundColor: Colors.white,
              maxRadius: 5,
              minRadius: 2,
            ),
          if (page.pageIndex == 1)
            SizedBox(
              width: 5,
            ),
          if (page.pageIndex == 1)
            Container(
              height: 10,
              width: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          if (page.pageIndex == 1)
            SizedBox(
              width: 5,
            ),
          if (page.pageIndex == 1)
            const CircleAvatar(
              backgroundColor: Colors.white,
              maxRadius: 5,
              minRadius: 2,
            ),
          if (page.pageIndex == 2)
            const CircleAvatar(
              backgroundColor: Colors.white,
              maxRadius: 5,
              minRadius: 2,
            ),
          if (page.pageIndex == 2)
            SizedBox(
              width: 5,
            ),
          if (page.pageIndex == 2)
            const CircleAvatar(
              backgroundColor: Colors.white,
              maxRadius: 5,
              minRadius: 2,
            ),
          if (page.pageIndex == 2)
            SizedBox(
              width: 5,
            ),
          if (page.pageIndex == 2)
            Container(
              height: 10,
              width: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
        ],
      );
    });
  }
}

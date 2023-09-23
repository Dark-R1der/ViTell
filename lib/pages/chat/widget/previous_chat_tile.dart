import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';

class PreviousChatTile extends StatelessWidget {
  const PreviousChatTile({super.key});
  @override
  Widget build(BuildContext context) {
    String title = "Title 1";
    String message =
        "Hello hope you are doing fine today? I am AI an model so I don't feel any emotion";
    double sizeH = MediaQuery.of(context).size.height;

    double sizeW = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: 0.12 * sizeH,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFF5F5F5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 14.0,
          left: 14,
          bottom: 14,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                txt(title, weight: FontWeight.w600, size: 0.026 * sizeH),
                Container(
                  width: 0.76 * sizeW,
                  child: txt(
                    size: 0.014 * sizeH,
                    textAlign: TextAlign.left,
                    message,
                    color: const Color(0xFFBBBBBB),
                  ),
                )
              ],
            ),
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}

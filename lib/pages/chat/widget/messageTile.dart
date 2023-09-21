import 'package:chatbot/pages/chat/model/chatMessages.dart';
import 'package:chatbot/utils/logger.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatefulWidget {
  MessageTile({super.key, required this.message});
  ChatMessage message;

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    // Logger.logA(widget.message.text.length.toString());
    bool isChecked = false;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: widget.message.isSender
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        widget.message.isSender
            ? InkWell(
                onTap: null,
                child: isChecked
                    ? const Icon(Icons.bookmark)
                    : const Icon(
                        Icons.bookmark_outline,
                        color: Color(0xFFBBBBBB),
                      ),
              )
            : const SizedBox(),
        Container(
          padding: const EdgeInsets.all(20),
          width: 260,
          decoration: BoxDecoration(
            color: widget.message.isSender
                ? const Color(0xFF17C3CE)
                : const Color(0xFFF5F5F5),
            borderRadius: widget.message.isSender
                ? const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
          ),
          child: txt(
            widget.message.text,
            maxLine: 200,
            size: 16,
            color: widget.message.isSender ? Colors.white : Colors.black,
            textAlign: TextAlign.left,
          ),
        ),
        if (widget.message.isSender == false)
          const SizedBox(
            width: 5,
          ),
        if (widget.message.text.length <= 100)
          if (widget.message.isSender == false)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/icons/copy.png",
                ),
                const SizedBox(
                  height: 10,
                ),
                const Icon(
                  Icons.more_horiz,
                  color: Color(0xFFBBBBBB),
                ),
              ],
            ),
        if (widget.message.text.length > 100)
          if (widget.message.isSender == false)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/icons/copy.png",
                ),
                const SizedBox(
                  height: 13,
                ),
                const Icon(
                  Icons.share_outlined,
                  color: Color(0xFFBBBBBB),
                ),
                const SizedBox(
                  height: 13,
                ),
                const Icon(
                  Icons.edit_outlined,
                  color: Color(0xFFBBBBBB),
                ),
                const SizedBox(
                  height: 13,
                ),
                const Icon(
                  Icons.print_outlined,
                  color: Color(0xFFBBBBBB),
                ),
                const SizedBox(
                  height: 13,
                ),
                const Icon(
                  Icons.bookmark_outline,
                  color: Color(0xFFBBBBBB),
                ),
                const SizedBox(
                  height: 13,
                ),
                const Icon(
                  Icons.translate_outlined,
                  color: Color(0xFFBBBBBB),
                ),
              ],
            ),
      ],
    );
  }
}

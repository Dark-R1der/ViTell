import 'package:chatbot/pages/chat/model/chatMessages.dart';
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
    bool isChecked = false;
    return Row(
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
          padding: const EdgeInsets.all(16),
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
            size: 16,
            color: widget.message.isSender ? Colors.white : Colors.black,
            textAlign: TextAlign.left,
          ),
        ),
        widget.message.isSender
            ? const SizedBox()
            : const Column(
                children: [
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.bookmark_outline),
                  ),
                ],
              ),
      ],
    );
  }
}

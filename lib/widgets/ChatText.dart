import 'package:CeylonScape/theme/colors.dart';
import 'package:CeylonScape/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum ChatTextType { send, receive}

class ChatText extends StatelessWidget {
  final ChatTextType type;
  final String text;

  const ChatText({super.key, required this.type, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: (type == ChatTextType.send) ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          constraints: (type == ChatTextType.send) ? const BoxConstraints(maxWidth: 290.0) : const BoxConstraints(maxWidth: 360.0),
          decoration: BoxDecoration(
            color: type == ChatTextType.receive ? Colors.transparent : CeylonScapeColor.black5,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
              bottomRight: type == ChatTextType.receive ? const Radius.circular(16) : const Radius.circular(0),
              bottomLeft: type == ChatTextType.receive ? const Radius.circular(0) : const Radius.circular(16),
            ),
            boxShadow: const [
              BoxShadow(
                color: CeylonScapeColor.black0,
                blurRadius: 32,
                offset: Offset(0, 8),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: type == ChatTextType.receive ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Text(
                  text,
                  style: CeylonScapeFont.highlightEmphasis,
                  softWrap: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

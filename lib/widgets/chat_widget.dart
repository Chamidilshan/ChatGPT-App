import 'package:chatgpt_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:chatgpt_app/widgets/text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    Key? key,
    required this.msg,
    required this.chatIndex
  }) :
        super(key: key);

  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: chatIndex == 0 ? scaffoldBackgroundColor: cardcolor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset( chatIndex == 0 ? 'images/person.png' : 'images/chat_logo.png',
                height: 30.0,
                  width: 30.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: TextWidget(
                      label: msg,
                  ),
                ),
                chatIndex == 0 ? SizedBox.shrink()
                    :Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.thumb_down_outlined,
                      color: Colors.white,
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

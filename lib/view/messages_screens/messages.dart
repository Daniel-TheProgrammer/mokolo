import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common_widgets/text_wisgets.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomTexts.subHeadText("Messages"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SvgPicture.asset(
              "assets/illus/msg.svg",
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: CustomTexts.subHeadText(
              "No message found",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: CustomTexts.contentText(
              txt:
                  "Go to the home page and tap on the “price button” to start a new discussion with a seller.",
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

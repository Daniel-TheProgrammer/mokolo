import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mokolo/constants/color_constants.dart';
import 'package:mokolo/constants/enums.dart';

import '../../common_widgets/button_widget.dart';
import '../../common_widgets/text_wisgets.dart';
import '../../route_manager/route.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: CColor.bgGreyMokolo,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/illus/start3.png")),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: CustomTexts.customText("You’re set to start", 20,
                CColor.blackMokolo, FontWeight.w600, FontStyle.normal),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: CustomTexts.customText(
                "Thanks for using Mokolo. You can choose to complete your profile or go to the home screen.",
                14,
                CColor.blackMokolo,
                FontWeight.w500,
                FontStyle.normal),
          ),
          const Spacer(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ButtonWidget(
                  buttonName: 'Go to home',
                  type: ButtonType.green,
                  onpressed: () {
                    Get.offAllNamed(Routes.getBottomNav());
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ButtonWidget(
                  buttonName: 'Complete my profile',
                  type: ButtonType.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 28,
          )
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mokolo/constants/enums.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../common_widgets/button_widget.dart';
import '../../common_widgets/custom_text.dart';
import '../../constants/color_constants.dart';

Widget buildIndecator(activeIndex, sliderList) {
  return AnimatedSmoothIndicator(
      effect: ExpandingDotsEffect(
          dotHeight: 10,
          dotWidth: 10,
          paintStyle: PaintingStyle.fill,
          strokeWidth: 1,
          dotColor: Colors.black38,
          activeDotColor: CColor.greenMokolo),
      activeIndex: activeIndex,
      count: sliderList.length);
}

Widget navigationRow(activeIndex, controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // activeIndex == 0
      //     ? const SizedBox()
      //     :
      Expanded(
        child: ButtonOutLine(
          height: 50,
          onpressed: () {
            activeIndex == 0
                ? Get.back()
                : controller.previousPage(
                    duration: const Duration(milliseconds: 500));
          },
          buttonName: activeIndex == 0 ? "Close" : "Back",
        ),
      ),
      // activeIndex == 2
      //     ? const SizedBox()
      //
      //    :
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: ButtonWidget(
          height: 50,
          onpressed: () {
            activeIndex == 2
                ? Get.back()
                : controller.nextPage(
                    duration: const Duration(milliseconds: 500));
          },
          type: ButtonType.black,
          buttonName: activeIndex == 2 ? "Done" : "Next",
        ),
      ),
    ],
  );
}

Widget textWidget(
  activeIndex,
  sliderList,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      sliderList[activeIndex]['caption'].toString(),
      textAlign: TextAlign.center,
      style: AppTextStyle.jakarta(
          fontSize: 14,
          fontColor: CColor.blackMokolo,
          fontWeight: FontWeight.w400),
    ),
  );
}

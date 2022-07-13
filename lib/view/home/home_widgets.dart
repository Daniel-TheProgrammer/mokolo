import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mokolo/common_widgets/text_form_field.dart';
import 'package:mokolo/constants/enums.dart';

import '../../common_widgets/button_widget.dart';
import '../../common_widgets/text_wisgets.dart';
import '../../constants/color_constants.dart';

class HomeWidgets {
  static Card positionedImageBackground(Size size) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: size.height - 130,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage("assets/illus/lady.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  static buttonWidget(Size size, void Function()? onTap) {
    return Positioned(
      bottom: 2,
      child: Container(
        width: size.width - 32,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: ButtonHome(
          onpressed: onTap,
          amount: '25000',
        ),
      ),
    );
  }

  static followWidget(isFollow) {
    return Positioned(
      bottom: 50,
      left: 16,
      child: Container(
        alignment: Alignment.center,
        height: 100,
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTexts.customText(false, "Afrikuma", 14,
                      CColor.whiteMokolo, FontWeight.w400, FontStyle.normal),
                  CustomTexts.customText(false, "@afrikuma_officiel", 14,
                      CColor.whiteMokolo, FontWeight.w400, FontStyle.normal),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                    color: isFollow == true ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: isFollow == true
                            ? Colors.transparent
                            : Colors.white)),
                child: CustomTexts.customText(
                    false,
                    isFollow == true ? "Follow" : "Following",
                    14,
                    isFollow == true ? Colors.black : CColor.whiteMokolo,
                    FontWeight.w400,
                    FontStyle.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static bubbleWidget(icon, content, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.all(4),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: CColor.blackMokolo.withOpacity(0.4), shape: BoxShape.circle),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            icon,
            color: Colors.white,
            size: 22,
          ),
          CustomTexts.customText(false, content, 12, CColor.whiteMokolo,
              FontWeight.w400, FontStyle.normal),
        ]),
      ),
    );
  }

  static void converBottomSheet(context, TextEditingController controller) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (builder) {
          return Container(
              margin: const EdgeInsets.all(16),
              height: 300.0,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      CustomTexts.subHeadText("Discutez avec Afrikuma"),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: CColor.greyMokolo,
                              borderRadius: BorderRadius.circular(100)),
                          child: const Icon(
                            Icons.close,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                  TextAreaWidget(controller: controller, errMsg: "Required"),
                  const ButtonWidget(
                      buttonName: "Start the discussion",
                      type: ButtonType.green)
                ],
              ));
        });
  }

  static void infoBottomSheet(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (builder) {
          return Container(
              margin: const EdgeInsets.all(16),
              height: 200.0,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      CustomTexts.subHeadText("Product details"),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: CColor.greyMokolo,
                              borderRadius: BorderRadius.circular(100)),
                          child: const Icon(
                            Icons.close,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  CustomTexts.contentText(
                      size: 16,
                      clr: CColor.blackMokolo,
                      txt:
                          "Sociis morbi interdum maecenas dolor convallis lorem morbi bibendum mauris. Ut habitant eget adipiscing purus placerat lacus cursus. Donec aliquet pellentesque pharetra sodales tincidunt eu. "),
                  const Spacer()
                ],
              ));
        });
  }
}

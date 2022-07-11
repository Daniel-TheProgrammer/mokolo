import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mokolo/common_widgets/text_wisgets.dart';
import 'package:mokolo/constants/color_constants.dart';

import '../../route_manager/route.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CColor.greenMokolo,
        title: const Text("Settings"),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_sharp,
            color: CColor.whiteMokolo,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTexts.subHeadText('Profile'),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: CColor.bgGreyMokolo,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    listItem("Edit my profile", false, () {
                      Get.toNamed(Routes.getEditProfile());
                    }),
                    const Divider(),
                    listItem("Share profile", false, null),
                    // const Divider(),
                    // listItem("Edit my profile", null),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTexts.subHeadText('Settings'),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: CColor.bgGreyMokolo,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    listItem("Language", true, null),
                    const Divider(),
                    listItem("Privacy policy", false, null),
                    const Divider(),
                    listItem("Terms of use", false, null),
                    const Divider(),
                    listItem("Rate the app", false, null),
                    const Divider(),
                    listItem("Share the app", false, null),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget listItem(txt, isLanguage, void Function()? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          CustomTexts.contentText(txt: txt, clr: CColor.blackMokolo, size: 16),
          const Spacer(),
          isLanguage
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  decoration: BoxDecoration(
                      color: CColor.greyMokolo,
                      borderRadius: BorderRadius.circular(100)),
                  child: CustomTexts.customText(
                      true,
                      "English",
                      12,
                      CColor.blackGreyMokolo,
                      FontWeight.w600,
                      FontStyle.normal),
                )
              : Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 18,
                  color: CColor.blackMokolo,
                ),
        ],
      ),
    ),
  );
}

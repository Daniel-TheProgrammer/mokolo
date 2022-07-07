import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/text_wisgets.dart';
import '../../constants/color_constants.dart';

class AuthWidgets {
  static PreferredSize appBar(title, subtitle, isLeading) {
    return PreferredSize(
      preferredSize: Size.fromHeight(130.0),
      child: AppBar(
        // toolbarHeight: isLeading == false ? 95 : 120,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              isLeading == false
                  ? CustomTexts.customText(title, 22, CColor.blackMokolo,
                      FontWeight.w600, FontStyle.normal)
                  : Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                        CustomTexts.customText(title, 22, CColor.blackMokolo,
                            FontWeight.w600, FontStyle.normal),
                      ],
                    ),
              isLeading == false
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTexts.customText(
                          subtitle,
                          15,
                          CColor.blackGreyMokolo,
                          FontWeight.w500,
                          FontStyle.normal),
                    )
                  : Row(
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        CustomTexts.customText(
                            subtitle,
                            15,
                            CColor.blackGreyMokolo,
                            FontWeight.w500,
                            FontStyle.normal),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

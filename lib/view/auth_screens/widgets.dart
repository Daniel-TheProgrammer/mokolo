import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/text_wisgets.dart';
import '../../constants/color_constants.dart';

class AuthWidgets {
  static PreferredSize appBar(title, subtitle, isLeading) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(130.0),
      child: AppBar(
        // toolbarHeight: isLeading == false ? 95 : 120,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              isLeading == false
                  ? CustomTexts.customText(false, title, 24, CColor.blackMokolo,
                      FontWeight.w500, FontStyle.normal)
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: CustomTexts.customText(
                              false,
                              title,
                              24,
                              CColor.blackMokolo,
                              FontWeight.w500,
                              FontStyle.normal),
                        ),
                      ],
                    ),
              isLeading == false
                  ? Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: CustomTexts.customText(
                          false,
                          subtitle,
                          14,
                          CColor.blackGreyMokolo,
                          FontWeight.w400,
                          FontStyle.normal),
                    )
                  : Row(
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        CustomTexts.customText(
                            false,
                            subtitle,
                            14,
                            CColor.blackGreyMokolo,
                            FontWeight.w400,
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

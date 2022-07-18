import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/button_widget.dart';
import '../../common_widgets/text_form_field.dart';
import '../../common_widgets/text_wisgets.dart';
import '../../constants/color_constants.dart';
import '../../constants/enums.dart';
import '../../route_manager/route.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key}) : super(key: key);
  final description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: CustomTexts.subHeadText("Product details"),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(children: <Widget>[
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  TextAreaWidget(
                    controller: description,
                    errMsg: 'Required *',
                    hint: "Product description",
                  ),
                  selectItem("Product category", () {}, true, ""),
                  selectItem("Item price", () {}, false, "FCFA"),
                  size.height < 600
                      ? ButtonWidget(
                          buttonName: 'Publish',
                          type: ButtonType.green,
                          onpressed: () {
                            Get.toNamed(Routes.getBottomNav());
                          })
                      : const SizedBox()
                ],
              ),
            ),
            size.height < 600
                ? const SizedBox()
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: ButtonWidget(
                        buttonName: 'Next',
                        type: ButtonType.green,
                        onpressed: () {
                          Get.toNamed(Routes.getBottomNav());
                        }),
                  ),
          ]),
        ),
      ),
    );
  }
}

Widget selectItem(txt, void Function()? onTap, bool isIcon, txt2) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: CColor.bgGreyMokolo, borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CustomTexts.customText(
              true,
              txt,
              14,
              isIcon == true ? CColor.blackMokolo : CColor.blackGreyMokolo,
              FontWeight.w400,
              FontStyle.normal),
          const Spacer(),
          isIcon == true
              ? Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 18,
                  color: CColor.blackMokolo,
                )
              : CustomTexts.customText(true, txt2, 14, CColor.blackMokolo,
                  FontWeight.w500, FontStyle.normal),
        ],
      ),
    ),
  );
}

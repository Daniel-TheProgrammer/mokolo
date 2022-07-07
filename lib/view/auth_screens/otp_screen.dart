import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mokolo/common_widgets/otp_field.dart';
import 'package:mokolo/view/auth_screens/widgets.dart';

import '../../common_widgets/button_widget.dart';
import '../../common_widgets/text_wisgets.dart';
import '../../constants/color_constants.dart';
import '../../constants/enums.dart';
import '../../route_manager/route.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key}) : super(key: key);
  final otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AuthWidgets.appBar("6-digit code",
            "Please enter the code we have sent to \n+237 650 18 57 27", true),
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(16),
            child: Stack(children: <Widget>[
              Column(
                children: [
                  PinEntryField(
                    value: "1234",
                    controller: otp,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CustomTexts.customText(
                          false,
                          "Resend code in 0:30",
                          14,
                          CColor.blackGreyMokolo,
                          FontWeight.w400,
                          FontStyle.normal),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
                left: 0,
                right: 0,
                child: ButtonWidget(
                    buttonName: 'Next',
                    type: ButtonType.green,
                    onpressed: () {
                      Get.toNamed(Routes.getStart());
                    }),
              ),
            ]),
          ),
        ));
  }
}

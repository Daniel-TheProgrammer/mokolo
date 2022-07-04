import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mokolo/view/auth_screens/widgets.dart';

import '../../common_widgets/button_widget.dart';
import '../../common_widgets/international_phone.dart';
import '../../constants/enums.dart';
import '../../route_manager/route.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final phopne = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AuthWidgets.appBar(
            "Let’s get started", "Enter your phone number to continue", false),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Stack(children: <Widget>[
              Column(
                children: [
                  InternationalPhone(
                    controller: phopne,
                  ),
                ],
              ),
              Positioned(
                bottom: 50 + MediaQuery.of(context).viewInsets.bottom,
                left: 0,
                right: 0,
                child: phopne.text == ""
                    ? ButtonWidgetOpa(
                        buttonName: 'Next',
                        type: ButtonType.green,
                        onpressed: () {
                          Get.toNamed(Routes.getOtp());
                        },
                      )
                    : ButtonWidgetOpa(
                        buttonName: 'Next',
                        type: ButtonType.green,
                        onpressed: () {
                          Get.toNamed(Routes.getOtp());
                        },
                      ),
              ),
            ]),
          ),
        ));
  }
}

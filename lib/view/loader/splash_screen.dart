import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mokolo/constants/color_constants.dart';
import '../../common_widgets/text_wisgets.dart';
import '../../route_manager/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.getLogin());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColor.greenMokolo,
      body: Center(
          child: CustomTexts.customText(false, "mokolo", 50, CColor.blackMokolo,
              FontWeight.w900, FontStyle.italic)),
    );
  }
}

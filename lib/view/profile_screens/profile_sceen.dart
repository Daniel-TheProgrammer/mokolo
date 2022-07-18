import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mokolo/constants/color_constants.dart';

import '../../common_widgets/text_wisgets.dart';
import '../../route_manager/route.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              profileCard(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(),
              ),
              Expanded(child: gridWidget()),
            ],
          ),
        ),
      ),
    );
  }
}

Widget profileCard() {
  return ListTile(
    horizontalTitleGap: 0,
    contentPadding: const EdgeInsets.all(0),
    leading: const CircleAvatar(
      radius: 45,
      child: Icon(
        Icons.person,
        size: 40,
      ),
    ),
    title: CustomTexts.subHeadText("Full name"),
    subtitle: CustomTexts.customText(false, "Usernane", 16, CColor.blackMokolo,
        FontWeight.w700, FontStyle.normal),
    trailing: GestureDetector(
      onTap: () {
        Get.toNamed(Routes.getSettingsProfile());
      },
      child: Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: CColor.greenMokolo,
              borderRadius: BorderRadius.circular(18)),
          child: Icon(
            Icons.settings,
            size: 30,
            color: CColor.whiteMokolo,
          )),
    ),
  );
}

Widget gridWidget() {
  return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemCount: 10,
      itemBuilder: (BuildContext ctx, index) {
        return Container(
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage(
                    "assets/icons/img.png",
                  ),
                  fit: BoxFit.cover),
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15)),
        );
      });
}

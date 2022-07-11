import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/button_widget.dart';
import '../../common_widgets/international_phone.dart';
import '../../common_widgets/text_form_field.dart';
import '../../common_widgets/text_wisgets.dart';
import '../../constants/color_constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String countryValue = "";

  String? stateValue;

  String? cityValue;
  final phoneController = TextEditingController();
  final userName = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CColor.greenMokolo,
        title: const Text("Edit profile"),
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
      body: SafeArea(
        child: Container(
          height: double.infinity,
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFieldWidget(
                  controller: userName,
                  errMsg: "Username Required",
                  hint: 'Username'),
              TextFieldWidget(
                  controller: nameController,
                  errMsg: "Full name Required",
                  hint: 'Full name'),
              selectCountry(),
              selectItem("Select city", null),
              InternationalPhone(
                hint: "Whatsapp number",
                controller: phoneController,
              ),
              const Spacer(),
              const ButtonOutLine(
                onpressed: null,
                buttonName: 'Edit',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectCountry() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: CColor.bgGreyMokolo, borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          CountryListPick(
            appBar: AppBar(
              backgroundColor: CColor.greenMokolo,
              title: const Text('Pick your country'),
            ),
            theme: CountryTheme(
              isShowFlag: true,
              alphabetTextColor: CColor.blueMokolo,
              alphabetSelectedTextColor: CColor.blueMokolo,
              isShowTitle: true,
              isShowCode: false,
              isDownIcon: false,
              showEnglishName: false,
              labelColor: CColor.blackMokolo,
            ),
            initialSelection: '+237',
            // or
            // initialSelection: 'US'
            onChanged: (CountryCode? code) {
              //  print(code);
            },
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_sharp,
            size: 18,
            color: CColor.blackMokolo,
          ),
        ],
      ),
    );
  }
}

Widget selectItem(txt, void Function()? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: CColor.bgGreyMokolo, borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CustomTexts.customText(true, txt, 16, CColor.blackMokolo,
              FontWeight.w600, FontStyle.normal),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_sharp,
            size: 18,
            color: CColor.blackMokolo,
          ),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mokolo/constants/color_constants.dart';

class InternationalPhone extends StatelessWidget {
  final TextEditingController controller;

  const InternationalPhone({Key? key, required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: IntlPhoneField(
        flagsButtonPadding: const EdgeInsets.all(15),
        showDropdownIcon: false,
        controller: controller,
        disableLengthCheck: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            contentPadding: const EdgeInsets.all(10),
            hintText: "Select",
            fillColor: CColor.bgGreyMokolo),
        initialCountryCode: 'CM',
        onChanged: (phone) {
          //   print(phone.completeNumber);
        },
        onCountryChanged: (country) {},
      ),
    );
  }
}

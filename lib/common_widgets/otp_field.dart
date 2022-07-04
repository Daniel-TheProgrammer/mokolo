import 'package:flutter/material.dart';
import 'package:mokolo/constants/color_constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinEntryField extends StatelessWidget {
  final String value;
  final TextEditingController controller;
  // final void Function()? onpressed;

  const PinEntryField({Key? key, required this.value, required this.controller
      // this.onpressed,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      enableActiveFill: true,
      controller: controller,
      cursorColor: CColor.blackMokolo,
      onChanged: (value) {},
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          fieldOuterPadding: const EdgeInsets.all(2),
          borderRadius: BorderRadius.circular(12),
          borderWidth: 0,
          fieldHeight: 50,
          fieldWidth: 50,
          selectedFillColor: CColor.bgGreyMokolo,
          activeFillColor: CColor.bgGreyMokolo,
          inactiveFillColor: CColor.bgGreyMokolo,
          inactiveColor: CColor.bgGreyMokolo),
      validator: (value) {
        ///validator of pin entry field
        if (value!.length != 6) {
          return "Please enter OTP";
        }

        return null;
      },
    );
  }
}

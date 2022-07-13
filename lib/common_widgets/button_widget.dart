import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../constants/enums.dart';
import 'text_wisgets.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final ButtonType type;

  final double? height;
  final void Function()? onpressed;

  const ButtonWidget({
    Key? key,
    required this.buttonName,
    required this.type,
    this.height,
    this.onpressed,
  }) : super(key: key);
  static const txtStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 50,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: type == ButtonType.black
              ? CColor.blackMokolo
              : CColor.greenMokolo,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: CustomTexts.customText(
            false,
            buttonName,
            14,
            type == ButtonType.black ? CColor.whiteMokolo : CColor.blackMokolo,
            FontWeight.w500,
            FontStyle.normal),
      ),
    );
  }
}

class ButtonOutLine extends StatelessWidget {
  final String buttonName;

  final double? height;
  final void Function()? onpressed;

  const ButtonOutLine({
    Key? key,
    required this.buttonName,
    this.height,
    this.onpressed,
  }) : super(key: key);
  static const txtStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 50,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: CColor.blackMokolo),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: CustomTexts.customText(false, buttonName, 14, CColor.blackMokolo,
            FontWeight.w500, FontStyle.normal),
      ),
    );
  }
}

class ButtonWidgetOpa extends StatelessWidget {
  final String buttonName;
  final ButtonType type;

  final double? height;
  final void Function()? onpressed;

  const ButtonWidgetOpa({
    Key? key,
    required this.buttonName,
    required this.type,
    this.height,
    this.onpressed,
  }) : super(key: key);
  static const txtStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 50,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: type == ButtonType.black
              ? CColor.blackMokolo.withOpacity(0.3)
              : CColor.greenMokolo.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: CustomTexts.customText(
            false,
            buttonName,
            15,
            type == ButtonType.black
                ? CColor.whiteMokolo.withOpacity(0.3)
                : CColor.blackMokolo.withOpacity(0.3),
            FontWeight.w600,
            FontStyle.normal),
      ),
    );
  }
}

class ButtonHome extends StatelessWidget {
  final String amount;

  final double? height;
  final void Function()? onpressed;

  const ButtonHome({
    Key? key,
    required this.amount,
    this.height,
    this.onpressed,
  }) : super(key: key);
  static const txtStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 50,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: CColor.greenMokolo,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTexts.contentText(
                  txt: '$amount FCFA', clr: CColor.blackMokolo, size: 14),
              const Spacer(),
              CustomTexts.contentText(
                  txt: "Buy", clr: CColor.blackMokolo, size: 14),
              const Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}

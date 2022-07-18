import 'package:flutter/material.dart';
import 'package:mokolo/constants/color_constants.dart';

import 'custom_text.dart';

class CustomTexts {
  static Widget customText(isCenter, cTxt, double size, color, weight, style) {
    return Text(
      cTxt,
      maxLines: 3,
      textAlign: isCenter == true ? TextAlign.center : TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyle.jakarta(
          fontStyle: style,
          fontSize: size,
          fontColor: color,
          fontWeight: weight),
    );
  }

  static Widget customTextUnderLine(cTxt, double size, color, weight) {
    return Text(
      cTxt,
      style: AppTextStyle.jakarta(
          decoration: TextDecoration.underline,
          fontSize: size,
          fontColor: color,
          fontWeight: weight),
    );
  }

  static Widget headerText(text) {
    return Text(
      text,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyle.jakarta(
          fontSize: 24,
          fontColor: CColor.blackMokolo,
          fontWeight: FontWeight.w500),
    );
  }

  static Widget subHeadText(text) {
    return Text(
      text,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyle.jakarta(
          fontSize: 18,
          fontColor: CColor.blackMokolo,
          fontWeight: FontWeight.w500),
    );
  }

  static Widget contentText({String? txt, Color? clr, double? size}) {
    return Text(
      txt ?? "",
      maxLines: 10,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyle.jakarta(
          fontSize: size ?? 14,
          fontColor: clr ?? CColor.blackGreyMokolo,
          fontWeight: FontWeight.w500),
    );
  }
}

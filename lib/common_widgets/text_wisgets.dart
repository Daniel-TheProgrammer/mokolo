import 'package:flutter/material.dart';
import 'package:mokolo/constants/color_constants.dart';

import 'custom_text.dart';

class CustomTexts {
  static Widget customText(cTxt, double size, color, weight, style) {
    return Text(
      cTxt,
      maxLines: 3,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyle.mokoloStryle(
          fontStyle: style,
          fontSize: size,
          fontColor: color,
          fontWeight: weight),
    );
  }

  static Widget customTextUnderLine(cTxt, double size, color, weight) {
    return Text(
      cTxt,
      style: AppTextStyle.mokoloStryle(
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
      style: AppTextStyle.mokoloStryle(
          fontSize: 24,
          fontColor: CColor.blackMokolo,
          fontWeight: FontWeight.w500),
    );
  }

  static Widget contentText(text) {
    return Text(
      text,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyle.mokoloStryle(
          fontSize: 14,
          fontColor: CColor.blackGreyMokolo,
          fontWeight: FontWeight.w400),
    );
  }
}

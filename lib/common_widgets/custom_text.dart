import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class AppTextStyle {
  static TextStyle jakarta(
      {Color? fontColor,
      double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      TextDecoration? decoration}) {
    return TextStyle(
        fontFamily: 'Jakarta',
        color: fontColor ?? CColor.blackMokolo,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize ?? 14,
        fontStyle: fontStyle ?? FontStyle.normal,
        decoration: decoration ?? TextDecoration.none);
  }
}

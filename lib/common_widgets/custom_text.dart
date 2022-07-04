import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color_constants.dart';

class AppTextStyle {
  static TextStyle mokoloStryle(
      {Color? fontColor,
      double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      TextDecoration? decoration}) {
    return GoogleFonts.plusJakartaSans(
        color: fontColor ?? CColor.blackMokolo,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize ?? 14,
        fontStyle: fontStyle ?? FontStyle.normal,
        decoration: decoration ?? TextDecoration.none);
  }
}

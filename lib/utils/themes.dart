import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

///APP THEME
///light theme
ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: CColor.greenMokolo,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800)),
);

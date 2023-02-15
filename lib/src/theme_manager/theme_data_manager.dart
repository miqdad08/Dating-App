import 'package:dating_app/src/theme_manager/color_manager.dart';
import 'package:dating_app/src/theme_manager/font_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationThemeData(){
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primary,
      elevation: 0,
    ),
    fontFamily: FontFamilyConstant.fontFamily,
  );
}


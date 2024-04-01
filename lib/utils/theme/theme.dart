import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/utils/theme/custom_themes/appbar_theme.dart';
import 'package:prashant_e_commerce_project/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:prashant_e_commerce_project/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:prashant_e_commerce_project/utils/theme/custom_themes/chip_theme.dart';
import 'package:prashant_e_commerce_project/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:prashant_e_commerce_project/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:prashant_e_commerce_project/utils/theme/custom_themes/text_field_theme.dart';
import 'package:prashant_e_commerce_project/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData LightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottonSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.LightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData DarkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    chipTheme: TChipTheme.lightChipTheme,
    checkboxTheme: TCheckboxTheme.darkheckboxTheme,
    bottomSheetTheme: TBottonSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.DarkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
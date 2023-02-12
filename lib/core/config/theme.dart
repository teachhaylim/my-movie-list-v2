import 'package:flutter/material.dart';
import 'package:my_movie_list_v2/core/config/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: AppColor.primaryColor,
    // colorScheme: const ColorScheme.light(
    //   primary: AppColor.primaryColor,
    //   primaryContainer: AppColor.primaryShade,
    //   secondary: AppColor.secondaryColor,
    //   secondaryContainer: AppColor.secondaryShade,
    // ),
    brightness: Brightness.light,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: AppColor.primaryColor,
    // colorScheme: const ColorScheme.dark(
    //   primary: AppColor.primaryColor,
    //   primaryContainer: AppColor.primaryShade,
    //   secondary: AppColor.secondaryColor,
    //   secondaryContainer: AppColor.secondaryShade,
    // ),
    brightness: Brightness.dark,
  );
}

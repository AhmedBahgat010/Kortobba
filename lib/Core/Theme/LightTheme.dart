import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utils/App Colors.dart';
import '../Utils/App Textstyle.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.backgroundColor,
  platform: TargetPlatform.iOS,
  fontFamily: "Tajawal",
  primaryColor: AppColors.primaryColor,
  canvasColor: Colors.transparent,
  iconTheme: const IconThemeData(color: AppColors.primaryColor, size: 25),
  primarySwatch: Colors.orange,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.white,
    toolbarHeight: 50,
    elevation: 0,
    surfaceTintColor: AppColors.white,
// color: AppColors.white,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.black),
    titleTextStyle: AppTextStyles.bold.copyWith(
      color: AppColors.black,
      fontFamily: "Tajawal",
    ),
    // systemOverlayStyle: SystemUiOverlayStyle(
    //     // statusBarColor: AppColors.primaryColor,
    //     statusBarIconBrightness: Brightness.light)
  ),
);

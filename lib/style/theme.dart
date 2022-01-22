import 'package:flutter/material.dart';
import 'package:islamic/style/color.dart';

ThemeData theme = ThemeData(
  drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.mainColor,
  ),
  backgroundColor: AppColors.mainColor,
  cardColor: AppColors.mainColor,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: AppColors.mainColor,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: "NotoSansArabic",
  primaryColor: AppColors.mainColor,
);
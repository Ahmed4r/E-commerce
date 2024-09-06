import 'package:app1/ui/utils/appcolors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
      primaryColor: Appcolors.primaryColor,
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Appcolors.whiteColor),
          titleMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Appcolors.whiteColor)));
}

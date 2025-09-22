import 'package:flutter/material.dart';
import 'package:oborkom/core/utils/app_colors.dart';

ThemeData appTheme() => ThemeData(
  fontFamily: 'Cairo',
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      fontFamily: 'Cairo',
      color: AppColors.mainColor,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),
);

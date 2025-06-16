
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle bold18Black = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );


  static TextStyle bold24Black = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );


  static TextStyle regular16Black = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle  bold14MainColor = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.mainColor,
  );


  static TextStyle regular12MainColor = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.mainColor,
  );


  static TextStyle bold14White = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static  TextStyle regular12Grey = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  static TextStyle bold14Grey = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.darkGreyColor,
  );



}

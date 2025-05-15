import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  static TextStyle baseTextStyle = TextStyle(
    color: appColors.textPrimary,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.0,
    height: 1.5,
  );

  static TextStyle superTiny = baseTextStyle.copyWith(fontSize: 9);
  static TextStyle tiny = baseTextStyle.copyWith(fontSize: 10);
  static TextStyle caption = baseTextStyle.copyWith(fontSize: 12);
  static TextStyle body = baseTextStyle.copyWith(fontSize: 14);
  static TextStyle body2 = baseTextStyle.copyWith(fontSize: 16);
  static TextStyle subtitle =
      baseTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle title1 =
      baseTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w600);
  static TextStyle title2 =
      baseTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w600);
  static TextStyle title3 =
      baseTextStyle.copyWith(fontSize: 32, fontWeight: FontWeight.bold);
  static TextStyle otp =
      baseTextStyle.copyWith(fontSize: 56, fontWeight: FontWeight.w600);
  static TextStyle button = baseTextStyle.copyWith(
      fontSize: 18, fontWeight: FontWeight.bold, color: appColors.white);
  static TextStyle field =
      baseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.bold);
  static TextStyle hint =
      baseTextStyle.copyWith(fontSize: 14, color: appColors.textPrimary);
  static TextStyle appBar = baseTextStyle.copyWith(
      fontSize: 16, fontWeight: FontWeight.w600, color: appColors.black);

  // navigation bar
  static TextStyle navBottom =
      baseTextStyle.copyWith(fontSize: 13, fontWeight: FontWeight.bold);
}

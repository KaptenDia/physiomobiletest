import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../di/di.dart';

/// Retrieves an instance of [AppColors] using the [getIt] service locator.
final appColors = getIt<AppColors>();

@lazySingleton

/// A class that defines the color palette used in the application.
class AppColors {
  Color primary = const Color.fromARGB(255, 163, 8, 8);
  Color secondary = const Color(0xffcba258);

  Color backgroundPrimary = const Color(0xffffffff);
  Color backgroundSecondary = const Color(0xffE4F3F2);
  Color card = const Color(0xA8F3F3F3);

  Color textPrimary = const Color(0xFF474F50);
  Color textSecondary = const Color.fromARGB(255, 86, 108, 110);
  Color textHint = const Color(0xffCCCCCC);
  Color textError = const Color(0xffd62b1f);

  Color fieldBackground = const Color(0xA8F3F3F3);
  Color fieldBorder = const Color(0xffB4B5B9);
  Color fieldFocusBorder = const Color(0xff006241);
  Color fieldError = const Color(0xffd62b1f);

  Color buttonPrimary = const Color(0xffcba258);
  Color buttonSecondary = const Color(0xffcba258);

  Color indicatorLoading = const Color(0xffcba258);
  Color separator = const Color(0xffE4E4E4);

  Color white = const Color(0xffffffff);
  Color black = const Color(0xFF000000);
}

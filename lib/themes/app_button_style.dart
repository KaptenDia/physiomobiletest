import 'package:flutter/material.dart';
import 'package:physiomobile/themes/app_colors.dart';

import 'app_text_style.dart';

class ButtonDefault extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final EdgeInsets margin;
  final double? width;
  final Color? color;
  final double elevation;
  final bool isLoading;
  final bool isEnabled;
  final bool? iconDataPrefixPosition;
  final IconData? iconData;

  const ButtonDefault({
    super.key,
    required this.title,
    required this.onPressed,
    this.width = double.infinity,
    this.margin = const EdgeInsets.all(0),
    this.color,
    this.elevation = 3,
    this.isLoading = false,
    this.isEnabled = true,
    this.iconData,
    this.iconDataPrefixPosition = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: width,
      margin: margin,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : !isEnabled
                ? null
                : onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: appColors.white,
          backgroundColor: color ?? appColors.buttonPrimary,
          shadowColor: color ?? appColors.buttonPrimary,
          elevation: elevation,
          disabledBackgroundColor: isEnabled
              ? (color ?? appColors.buttonPrimary)
              : (color ?? appColors.buttonPrimary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    appColors.white,
                  ),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (iconDataPrefixPosition == true && iconData != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(iconData),
                    ),
                  Text(
                    title,
                    style: AppTextStyle.button,
                  ),
                  if (iconData != null && iconDataPrefixPosition == false)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Icon(iconData),
                    )
                ],
              ),
      ),
    );
  }
}

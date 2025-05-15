import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class DefaultDialog extends StatelessWidget {
  final String? illustration;
  final String title;
  final String message;
  final Function onDismiss;

  const DefaultDialog(
      {super.key,
      this.illustration,
      required this.title,
      required this.message,
      required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: appColors.backgroundPrimary,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (illustration == null)
                    Icon(
                      Icons.error_outline_rounded,
                      size: 80,
                      color: appColors.primary,
                    ),
                  if (illustration != null)
                    Image.asset(illustration!, height: 80),
                  Container(
                    margin: const EdgeInsets.all(24),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.title1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 32),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.body,
                    ),
                  ),
                  SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: appColors.white,
                        backgroundColor: appColors.buttonPrimary,
                        shadowColor: appColors.buttonPrimary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Close',
                        style: AppTextStyle.button,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

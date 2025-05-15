import 'package:flutter/material.dart';
import 'package:physiomobile/utils/utils.dart';

import '../../themes/themes.dart';
import '../container_bottom_sheet.dart';

class DefaultModal extends StatelessWidget {
  final String? illustration;
  final String? title;
  final String? message;
  final String? buttonTitle;
  final bool? showCloseButton;
  final Function()? onCloseButton;
  final Function()? onPressed;

  const DefaultModal({
    super.key,
    this.illustration,
    this.title,
    this.message,
    this.buttonTitle,
    this.showCloseButton = false,
    this.onCloseButton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerBottomSheet(
      showCloseButton: showCloseButton ?? false,
      actionDismiss: onCloseButton,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (illustration == null)
            Icon(
              Icons.error_outline_rounded,
              size: 80,
              color: appColors.primary,
            ),
          if (illustration != null) Image.asset(illustration!, height: 80),
          const SizedBox(height: 8),
          Text(
            title ?? 'Oops!',
            style: AppTextStyle.title1.copyWith(
                fontWeight: FontWeight.bold, color: appColors.textPrimary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          if (message != null)
            Text(
              message ?? '-',
              style: AppTextStyle.body.copyWith(color: appColors.textPrimary),
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 50),
          ButtonDefault(
            title: buttonTitle ??
                (getCurrentLocalization() == 'id' ? 'Tutup' : 'Close'),
            elevation: 0,
            onPressed: () {
              Navigator.pop(context);
              onPressed?.call();
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:physiomobile/themes/app_colors.dart';

class ContainerBottomSheet extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final bool showCloseButton;
  final Function()? actionDismiss;

  const ContainerBottomSheet({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(16, 24, 16, 16),
    this.showCloseButton = false,
    this.actionDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showCloseButton)
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.fromLTRB(0, 24, 24, 16),
              child: CircleAvatar(
                backgroundColor: appColors.backgroundPrimary,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    actionDismiss?.call();
                  },
                  highlightColor: Colors.white,
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          Container(
            padding: padding,
            margin: EdgeInsets.fromLTRB(
                12, 0, 12, MediaQuery.of(context).padding.bottom + 12),
            decoration: BoxDecoration(
              color: appColors.backgroundPrimary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}

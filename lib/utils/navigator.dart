import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../di/di.dart';
import '../widgets/dialogs/default_dialog.dart';
import '../widgets/modals/default_modal.dart';

final appNavigator = getIt<AppNavigator>();

@lazySingleton
class AppNavigator {
  final navigatorKey = GlobalKey<NavigatorState>();
  BuildContext get context => navigatorKey.currentContext!;

  Future<dynamic> push(Widget destination) => navigatorKey.currentState!
      .push(CustomPageRoute(builder: (context) => destination));

  Future<dynamic> pushReplacement(Widget destination) =>
      navigatorKey.currentState!
          .pushReplacement(CustomPageRoute(builder: (context) => destination));

  Future<dynamic> pushAndRemoveUntil(Widget destination) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
          CustomPageRoute(builder: (context) => destination), (route) => false);

  void pop<T>({int popCount = 1, T? result}) {
    if (popCount == 1) {
      if (result != null) {
        navigatorKey.currentState!.pop(result);
      } else {
        navigatorKey.currentState!.pop();
      }
    } else {
      var count = 0;
      navigatorKey.currentState!.popUntil((route) {
        return count++ == popCount;
      });
    }
  }

  void popUntilFirst() =>
      navigatorKey.currentState!.popUntil((route) => route.isFirst);

  void showDefaultDialog({
    String? title = 'Oops...',
    String? message = 'Terjadi Kesalahan. Coba lagi nanti.',
    String? errorCode,
    Function? onDismiss,
  }) {
    showDialog(
      content: DefaultDialog(
        title: title ?? '-',
        message: message ?? '-',
        onDismiss: () => onDismiss?.call(),
      ),
    );
  }

  void showDialog({required Widget content}) {
    showGeneralDialog(
        context: context,
        pageBuilder: (context, anim1, anim2) {
          return PopScope(
              canPop: false,
              onPopInvoked: (val) async => false,
              child: const SizedBox());
        },
        transitionBuilder: (context, a1, a2, widget) {
          return PopScope(
              canPop: false,
              onPopInvoked: (val) async => false,
              child: Transform.scale(
                scale: a1.value,
                child: Opacity(
                  opacity: a1.value,
                  child: content,
                ),
              ));
        },
        barrierDismissible: true,
        barrierLabel: "");
  }

  void showDefaultModalBottom({
    String? illustration,
    String? title,
    String? message,
    String? buttonTitle,
    Function()? onPressed,
    Function()? onComplete,
    Function()? onBackButton,
    Function()? onCloseButton,
    bool isDismissible = true,
    bool showCloseButton = false,
  }) {
    showModalBottom(
      isDismissible: isDismissible,
      content: PopScope(
        onPopInvoked: onBackButton?.call(),
        child: DefaultModal(
          illustration: illustration,
          title: title,
          message: message,
          buttonTitle: buttonTitle,
          onPressed: onPressed,
          showCloseButton: showCloseButton,
          onCloseButton: onCloseButton,
        ),
      ),
    );
  }

  Future<void> showModalBottom({
    bool isDismissible = true,
    bool keyboardPush = false,
    required Widget content,
    Function()? onComplete,
  }) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: isDismissible,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => keyboardPush
          ? Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: content,
            )
          : content,
    ).whenComplete(() async {
      await Future.delayed(const Duration(milliseconds: 400));
      onComplete?.call();
    });
  }
}

class CustomPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 650);

  CustomPageRoute({builder}) : super(builder: builder);
}

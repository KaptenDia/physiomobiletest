import 'package:injectable/injectable.dart';
import 'package:physiomobile/const/messages.dart';
import 'package:physiomobile/utils/navigator.dart';

import '../di/di.dart';
import '../models/result_resp.dart';

final checkStatusResp = getIt<CheckStatusResp>();

@lazySingleton
class CheckStatusResp {
  var codeInvalidSession = '404';
  check(
    ResultResp resp, {
    bool showDialogError = true,
    Function()? onSuccess,
    Function()? onFailure,
    Function()? actionDialogError,
  }) async {
    if (resp is SuccessResp) {
      onSuccess?.call();
    } else {
      onFailure?.call();
      if (showDialogError) {
        appNavigator.showDefaultModalBottom(
            message: Messages().messageTimeout, onPressed: actionDialogError);
      }
    }
  }
}

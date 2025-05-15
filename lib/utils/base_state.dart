import 'package:flutter/material.dart';

import 'navigator.dart';

class BaseFormState extends BaseState {
  final key = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  bool validation() {
    autoValidateMode = AutovalidateMode.onUserInteraction;
    notifyListeners();
    return key.currentState!.validate();
  }
}

class BaseState with ChangeNotifier {
  bool isLoading = false;
  bool isLoadingMore = false;
  void setLoading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }

  void setLoadingMore(bool isLoadingMore) {
    this.isLoadingMore = isLoadingMore;
    notifyListeners();
  }

  void dismissLoading() => appNavigator.pop();
}

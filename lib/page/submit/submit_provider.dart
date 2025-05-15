import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:physiomobile/exlib.dart';

final submitProvider =
    ChangeNotifierProvider.autoDispose<SubmitState>((ref) => SubmitState());

class SubmitState extends BaseFormState {
  bool isValid = false;
  String? username;
  String? email;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  void submit() {
    if (validation()) {
      saveInput();
    } else {
      isValid = false;
      notifyListeners();
    }
  }

  void saveInput() {
    username = usernameController.text;
    email = emailController.text;
    isValid = true;
    notifyListeners();
  }
}

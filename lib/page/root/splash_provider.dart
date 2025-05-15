import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:physiomobile/page/main_menu.dart';
import 'package:physiomobile/utils/base_state.dart';
import 'package:physiomobile/utils/navigator.dart';

final splashProvider =
    ChangeNotifierProvider.autoDispose<SplashState>((ref) => SplashState());

class SplashState extends BaseState {
  late WidgetRef ref;
  SplashState() {
    _init();
  }

  setRef(WidgetRef ref) {
    this.ref = ref;
  }

  Future _init() async {
    await Future.delayed(const Duration(seconds: 3));
    appNavigator.pushReplacement(const MainMenu());
  }
}

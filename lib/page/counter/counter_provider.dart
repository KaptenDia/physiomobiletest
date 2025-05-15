import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:physiomobile/exlib.dart';

final counterProvider =
    ChangeNotifierProvider.autoDispose<CounterState>((ref) => CounterState());

class CounterState extends BaseState {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    if (_count == 0) return;
    _count--;
    notifyListeners();
  }
}

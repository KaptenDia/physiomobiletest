import 'package:injectable/injectable.dart';
import 'package:physiomobile/utils/utils.dart';

import '../di/di.dart';

final messages = getIt<Messages>();

@lazySingleton
class Messages {
  var messageTimeout = getCurrentLocalization() == 'id'
      ? "Koneksi bermasalah, silahkan ulangi atau coba beberapa saat lagi."
      : 'Connection timeout, please try again or try again later.';
}

// ignore_for_file: non_constant_identifier_names

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> ConfigureExlib() async => getIt.init();

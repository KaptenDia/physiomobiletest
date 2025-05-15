import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  Dio get httpClient {
    const timeout = Duration(minutes: 1);
    final options = BaseOptions(
      connectTimeout: timeout,
      receiveTimeout: timeout,
      validateStatus: (_) => true,
    );
    return Dio(options);
  }

  // @preResolve
  // Future<DataSecurity> get dataSecurity => DataSecurity.create();

  // @preResolve
  // Future<DatabaseHandler> get db => DatabaseHandler.create();
}

// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:physiomobile/const/messages.dart' as _i883;
import 'package:physiomobile/data/posts/posts_remote_data.dart' as _i939;
import 'package:physiomobile/data/posts/posts_repository.dart' as _i622;
import 'package:physiomobile/di/register_module.dart' as _i830;
import 'package:physiomobile/themes/app_colors.dart' as _i397;
import 'package:physiomobile/utils/check_status_resp.dart' as _i345;
import 'package:physiomobile/utils/navigator.dart' as _i17;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i361.Dio>(() => registerModule.httpClient);
    gh.lazySingleton<_i883.Messages>(() => _i883.Messages());
    gh.lazySingleton<_i397.AppColors>(() => _i397.AppColors());
    gh.lazySingleton<_i345.CheckStatusResp>(() => _i345.CheckStatusResp());
    gh.lazySingleton<_i17.AppNavigator>(() => _i17.AppNavigator());
    gh.lazySingleton<_i939.IPostsRemoteData>(() => _i939.PostsRemoteData());
    gh.lazySingleton<_i622.IPostsRepository>(
        () => _i622.PostsRepository(gh<_i939.IPostsRemoteData>()));
    return this;
  }
}

class _$RegisterModule extends _i830.RegisterModule {}

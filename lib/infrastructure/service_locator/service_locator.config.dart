// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../modules/authentication/data/datasource/local/authentication_local_dts.dart'
    as _i8;
import '../../modules/authentication/data/datasource/remote/authenticatation_remote_dts.dart'
    as _i4;
import '../../modules/authentication/data/repositories/authentication_repo_impl.dart'
    as _i10;
import '../../modules/authentication/domain/repositories/authentication_repo.dart'
    as _i9;
import '../../modules/authentication/domain/usecases/get_current_session.dart'
    as _i11;
import '../../modules/authentication/domain/usecases/login.dart' as _i12;
import '../../modules/authentication/domain/usecases/logout.dart' as _i14;
import '../../modules/authentication/presentation/screens/login/cubit/login_cubit.dart'
    as _i13;
import '../../modules/authentication/presentation/screens/splash/cubit/splash_cubit.dart'
    as _i16;
import '../architecutre/cubits/messenger/messenger_cubit.dart' as _i6;
import '../architecutre/cubits/session/session_cubit.dart' as _i15;
import '../client/api_client.dart' as _i3;
import '../local_storage/secure_storage/secure_storage.dart' as _i7;
import 'modules/core_module.dart' as _i17;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModules = _$CoreModules();
    gh.lazySingleton<_i3.APIClient>(() => _i3.UFClient());
    gh.factory<_i4.AuthenticationRemoteDTS>(
        () => _i4.AuthenticationRemoteDTSImpl(gh<_i3.APIClient>()));
    gh.factory<_i5.FlutterSecureStorage>(
        () => coreModules.getFlutterSecureStorage());
    gh.lazySingleton<_i6.MessengerCubit>(() => _i6.MessengerCubit());
    gh.factory<_i7.SecureStorage>(
        () => _i7.SecureStorageImpl(gh<_i5.FlutterSecureStorage>()));
    gh.factory<_i8.AuthenticationLocalDTS>(
        () => _i8.AuthLocalDTSImpl(gh<_i7.SecureStorage>()));
    gh.factory<_i9.AuthenticationRepo>(() => _i10.AuthenticationRepoImpl(
          gh<_i4.AuthenticationRemoteDTS>(),
          gh<_i8.AuthenticationLocalDTS>(),
        ));
    gh.factory<_i11.GetCurrentSession>(
        () => _i11.GetCurrentSession(gh<_i9.AuthenticationRepo>()));
    gh.factory<_i12.Login>(() => _i12.Login(gh<_i9.AuthenticationRepo>()));
    gh.factory<_i13.LoginCubit>(() => _i13.LoginCubit(gh<_i12.Login>()));
    gh.factory<_i14.Logout>(() => _i14.Logout(gh<_i9.AuthenticationRepo>()));
    gh.lazySingleton<_i15.SessionCubit>(
        () => _i15.SessionCubit(gh<_i14.Logout>()));
    gh.factory<_i16.SplashCubit>(
        () => _i16.SplashCubit(gh<_i11.GetCurrentSession>()));
    return this;
  }
}

class _$CoreModules extends _i17.CoreModules {}

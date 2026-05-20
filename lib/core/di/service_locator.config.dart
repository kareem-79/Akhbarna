// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:akhbarna/features/auth/login/data/data_sources/remote/login_api_remote_data_source.dart'
    as _i244;
import 'package:akhbarna/features/auth/login/data/data_sources/remote/login_remote_data_source.dart'
    as _i402;
import 'package:akhbarna/features/auth/login/data/repositories_impl/login_repository_impl.dart'
    as _i1059;
import 'package:akhbarna/features/auth/login/domain/repositories/login_repository.dart'
    as _i537;
import 'package:akhbarna/features/auth/login/domain/use_case/login_use_case.dart'
    as _i766;
import 'package:akhbarna/features/auth/login/presentation/cubit/login_cubit.dart'
    as _i281;
import 'package:akhbarna/features/auth/register/data/data_sources/local/auth_local_data_source.dart'
    as _i1023;
import 'package:akhbarna/features/auth/register/data/data_sources/local/auth_sharedPrefs_local_data_source.dart'
    as _i948;
import 'package:akhbarna/features/auth/register/data/data_sources/remote/register_api_remote_data_source.dart'
    as _i757;
import 'package:akhbarna/features/auth/register/data/data_sources/remote/register_remote_data_source.dart'
    as _i512;
import 'package:akhbarna/features/auth/register/data/repositories_impl/register_repository_impl.dart'
    as _i731;
import 'package:akhbarna/features/auth/register/domain/repositories/register_repository.dart'
    as _i861;
import 'package:akhbarna/features/auth/register/domain/use_case/register_use_case.dart'
    as _i794;
import 'package:akhbarna/features/auth/register/presentation/cubit/register_cubit.dart'
    as _i582;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1023.AuthLocalDataSource>(
      () => _i948.AuthSharedprefsLocalDataSource(),
    );
    gh.singleton<_i402.LoginRemoteDataSource>(
      () => _i244.LoginApiRemoteDataSource(),
    );
    gh.singleton<_i512.RegisterRemoteDataSource>(
      () => _i757.RegisterApiRemoteDataSource(),
    );
    gh.singleton<_i861.RegisterRepository>(
      () => _i731.RegisterRepositoryImpl(
        registerApiRemoteDataSource: gh<_i512.RegisterRemoteDataSource>(),
        authLocalDataSource: gh<_i1023.AuthLocalDataSource>(),
      ),
    );
    gh.singleton<_i537.LoginRepository>(
      () => _i1059.LoginRepositoryImpl(
        loginApiRemoteDataSource: gh<_i402.LoginRemoteDataSource>(),
        authLocalDataSource: gh<_i1023.AuthLocalDataSource>(),
      ),
    );
    gh.singleton<_i794.RegisterUseCase>(
      () => _i794.RegisterUseCase(
        registerRepository: gh<_i861.RegisterRepository>(),
      ),
    );
    gh.singleton<_i766.LoginUseCase>(
      () => _i766.LoginUseCase(loginRepository: gh<_i537.LoginRepository>()),
    );
    gh.singleton<_i582.RegisterCubit>(
      () => _i582.RegisterCubit(registerUseCase: gh<_i794.RegisterUseCase>()),
    );
    gh.singleton<_i281.LoginCubit>(
      () => _i281.LoginCubit(loginUseCase: gh<_i766.LoginUseCase>()),
    );
    return this;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:akhbarna/features/auth/forget_password/data/data_sources/remote/forget_password_api_remote_data_source.dart'
    as _i26;
import 'package:akhbarna/features/auth/forget_password/data/data_sources/remote/forget_password_remote_data_source.dart'
    as _i318;
import 'package:akhbarna/features/auth/forget_password/data/repositories_impl/forget_password_repository_impl.dart'
    as _i522;
import 'package:akhbarna/features/auth/forget_password/domain/repositories/forget_password_repository.dart'
    as _i975;
import 'package:akhbarna/features/auth/forget_password/domain/use_case/send_otp_use_case.dart'
    as _i343;
import 'package:akhbarna/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart'
    as _i739;
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
import 'package:akhbarna/features/layout/category/data/data_sources/category_api_remote_data_source.dart'
    as _i926;
import 'package:akhbarna/features/layout/category/data/data_sources/category_remote_data_source.dart'
    as _i433;
import 'package:akhbarna/features/layout/category/data/repositories_impl/category_repository_impl.dart'
    as _i521;
import 'package:akhbarna/features/layout/category/domain/repositories/category_repository.dart'
    as _i692;
import 'package:akhbarna/features/layout/category/domain/use_case/get_category_news_use_case.dart'
    as _i629;
import 'package:akhbarna/features/layout/category/presentation/cubit/category_news_cubit.dart'
    as _i462;
import 'package:akhbarna/features/layout/home/data/data_sources/remote/home_api_remote_data_source.dart'
    as _i130;
import 'package:akhbarna/features/layout/home/data/data_sources/remote/home_remote_data_source.dart'
    as _i29;
import 'package:akhbarna/features/layout/home/data/repositories_impl/home_repository_impl.dart'
    as _i478;
import 'package:akhbarna/features/layout/home/domain/repositories/home_repository.dart'
    as _i466;
import 'package:akhbarna/features/layout/home/domain/use_case/get_breaking_news_use_case.dart'
    as _i898;
import 'package:akhbarna/features/layout/home/domain/use_case/get_latest_news_use_case.dart'
    as _i393;
import 'package:akhbarna/features/layout/home/domain/use_case/get_most_read_news_use_case.dart'
    as _i537;
import 'package:akhbarna/features/layout/home/domain/use_case/get_trending_news_use_case.dart'
    as _i386;
import 'package:akhbarna/features/layout/home/presentation/cubit/breaking_news_cubit.dart'
    as _i862;
import 'package:akhbarna/features/layout/home/presentation/cubit/latest_news_cubit.dart'
    as _i676;
import 'package:akhbarna/features/layout/home/presentation/cubit/most_read_news_cubit.dart'
    as _i487;
import 'package:akhbarna/features/layout/home/presentation/cubit/trending_news_cubit.dart'
    as _i913;
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
    gh.singleton<_i433.CategoryRemoteDataSource>(
      () => _i926.CategoryRemoteDataSourceImpl(),
    );
    gh.singleton<_i318.ForgetPasswordRemoteDataSource>(
      () => _i26.ForgetPasswordApiRemoteDataSource(),
    );
    gh.singleton<_i29.HomeRemoteDataSource>(
      () => _i130.HomeApiRemoteDataSource(),
    );
    gh.singleton<_i402.LoginRemoteDataSource>(
      () => _i244.LoginApiRemoteDataSource(),
    );
    gh.singleton<_i512.RegisterRemoteDataSource>(
      () => _i757.RegisterApiRemoteDataSource(),
    );
    gh.singleton<_i692.CategoryRepository>(
      () => _i521.CategoryRepositoryImpl(
        remoteDataSource: gh<_i433.CategoryRemoteDataSource>(),
      ),
    );
    gh.singleton<_i861.RegisterRepository>(
      () => _i731.RegisterRepositoryImpl(
        registerApiRemoteDataSource: gh<_i512.RegisterRemoteDataSource>(),
        authLocalDataSource: gh<_i1023.AuthLocalDataSource>(),
      ),
    );
    gh.singleton<_i975.ForgetPasswordRepository>(
      () => _i522.ForgetPasswordRepositoryImpl(
        remoteDataSource: gh<_i318.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.singleton<_i537.LoginRepository>(
      () => _i1059.LoginRepositoryImpl(
        loginApiRemoteDataSource: gh<_i402.LoginRemoteDataSource>(),
        authLocalDataSource: gh<_i1023.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i629.GetCategoryNewsUseCase>(
      () => _i629.GetCategoryNewsUseCase(
        repository: gh<_i692.CategoryRepository>(),
      ),
    );
    gh.factory<_i794.RegisterUseCase>(
      () => _i794.RegisterUseCase(
        registerRepository: gh<_i861.RegisterRepository>(),
      ),
    );
    gh.singleton<_i466.HomeRepository>(
      () => _i478.HomeRepositoryImpl(
        remoteDataSource: gh<_i29.HomeRemoteDataSource>(),
      ),
    );
    gh.factory<_i766.LoginUseCase>(
      () => _i766.LoginUseCase(loginRepository: gh<_i537.LoginRepository>()),
    );
    gh.factory<_i898.GetBreakingNewsUseCase>(
      () => _i898.GetBreakingNewsUseCase(gh<_i466.HomeRepository>()),
    );
    gh.factory<_i582.RegisterCubit>(
      () => _i582.RegisterCubit(registerUseCase: gh<_i794.RegisterUseCase>()),
    );
    gh.factory<_i393.GetLatestNewsUseCase>(
      () => _i393.GetLatestNewsUseCase(repository: gh<_i466.HomeRepository>()),
    );
    gh.factory<_i537.GetMostReadNewsUseCase>(
      () =>
          _i537.GetMostReadNewsUseCase(repository: gh<_i466.HomeRepository>()),
    );
    gh.factory<_i386.GetTrendingNewsUseCase>(
      () =>
          _i386.GetTrendingNewsUseCase(repository: gh<_i466.HomeRepository>()),
    );
    gh.factory<_i343.SendOtpUseCase>(
      () => _i343.SendOtpUseCase(gh<_i975.ForgetPasswordRepository>()),
    );
    gh.factory<_i462.CategoryNewsCubit>(
      () => _i462.CategoryNewsCubit(
        getCategoryNewsUseCase: gh<_i629.GetCategoryNewsUseCase>(),
      ),
    );
    gh.factory<_i862.BreakingNewsCubit>(
      () => _i862.BreakingNewsCubit(
        getBreakingNewsUseCase: gh<_i898.GetBreakingNewsUseCase>(),
      ),
    );
    gh.factory<_i487.MostReadNewsCubit>(
      () => _i487.MostReadNewsCubit(
        getMostReadNewsUseCase: gh<_i537.GetMostReadNewsUseCase>(),
      ),
    );
    gh.factory<_i676.LatestNewsCubit>(
      () => _i676.LatestNewsCubit(
        getLatestNewsUseCase: gh<_i393.GetLatestNewsUseCase>(),
      ),
    );
    gh.factory<_i913.TrendingNewsCubit>(
      () => _i913.TrendingNewsCubit(
        getTrendingNewsUseCase: gh<_i386.GetTrendingNewsUseCase>(),
      ),
    );
    gh.factory<_i739.ForgetPasswordCubit>(
      () =>
          _i739.ForgetPasswordCubit(sendOtpUseCase: gh<_i343.SendOtpUseCase>()),
    );
    gh.factory<_i281.LoginCubit>(
      () => _i281.LoginCubit(loginUseCase: gh<_i766.LoginUseCase>()),
    );
    return this;
  }
}

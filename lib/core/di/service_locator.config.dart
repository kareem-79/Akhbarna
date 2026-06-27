// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:akhbarna/features/auth/forget_password/data/data_sources/remote/change_password_api_remote_data_source.dart'
    as _i980;
import 'package:akhbarna/features/auth/forget_password/data/data_sources/remote/change_password_remote_data_source.dart'
    as _i235;
import 'package:akhbarna/features/auth/forget_password/data/data_sources/remote/forget_password_api_remote_data_source.dart'
    as _i26;
import 'package:akhbarna/features/auth/forget_password/data/data_sources/remote/forget_password_remote_data_source.dart'
    as _i318;
import 'package:akhbarna/features/auth/forget_password/data/repositories_impl/change_password_repository_impl.dart'
    as _i412;
import 'package:akhbarna/features/auth/forget_password/data/repositories_impl/forget_password_repository_impl.dart'
    as _i522;
import 'package:akhbarna/features/auth/forget_password/domain/repositories/change_password_repository.dart'
    as _i412;
import 'package:akhbarna/features/auth/forget_password/domain/repositories/forget_password_repository.dart'
    as _i975;
import 'package:akhbarna/features/auth/forget_password/domain/use_case/change_password_use_case.dart'
    as _i473;
import 'package:akhbarna/features/auth/forget_password/domain/use_case/reset_password_use_case.dart'
    as _i39;
import 'package:akhbarna/features/auth/forget_password/domain/use_case/send_otp_use_case.dart'
    as _i343;
import 'package:akhbarna/features/auth/forget_password/domain/use_case/verify_otp_use_case.dart'
    as _i56;
import 'package:akhbarna/features/auth/forget_password/presentation/cubit/change_password_cubit.dart'
    as _i37;
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
import 'package:akhbarna/features/layout/bookMarket/data/data_sources/local/saved_local_data_source.dart'
    as _i264;
import 'package:akhbarna/features/layout/bookMarket/data/data_sources/local/saved_local_data_source_impl.dart'
    as _i720;
import 'package:akhbarna/features/layout/bookMarket/data/data_sources/remote/book_market_api_data_source.dart'
    as _i1007;
import 'package:akhbarna/features/layout/bookMarket/data/data_sources/remote/book_market_remote_data_source.dart'
    as _i539;
import 'package:akhbarna/features/layout/bookMarket/data/repositories_impl/book_market_repository_impl.dart'
    as _i526;
import 'package:akhbarna/features/layout/bookMarket/domain/repositories/book_market_repository.dart'
    as _i1062;
import 'package:akhbarna/features/layout/bookMarket/domain/use_case/get_saved_articles_use_case.dart'
    as _i98;
import 'package:akhbarna/features/layout/bookMarket/domain/use_case/is_saved_article_use_case.dart'
    as _i911;
import 'package:akhbarna/features/layout/bookMarket/domain/use_case/remove_all_articles_use_case.dart'
    as _i222;
import 'package:akhbarna/features/layout/bookMarket/domain/use_case/remove_article_use_case.dart'
    as _i815;
import 'package:akhbarna/features/layout/bookMarket/domain/use_case/save_article_use_case.dart'
    as _i939;
import 'package:akhbarna/features/layout/bookMarket/presentation/cubit/save_article_cubit.dart'
    as _i201;
import 'package:akhbarna/features/layout/category/data/data_sources/category_api_remote_data_source.dart'
    as _i926;
import 'package:akhbarna/features/layout/category/data/data_sources/category_remote_data_source.dart'
    as _i433;
import 'package:akhbarna/features/layout/category/data/data_sources/match_api_remote_data_source.dart'
    as _i596;
import 'package:akhbarna/features/layout/category/data/data_sources/match_remote_data_source.dart'
    as _i505;
import 'package:akhbarna/features/layout/category/data/repositories_impl/category_repository_impl.dart'
    as _i521;
import 'package:akhbarna/features/layout/category/data/repositories_impl/match_repository_impl.dart'
    as _i753;
import 'package:akhbarna/features/layout/category/domain/repositories/category_repository.dart'
    as _i692;
import 'package:akhbarna/features/layout/category/domain/repositories/matches_repository.dart'
    as _i1065;
import 'package:akhbarna/features/layout/category/domain/use_case/get_category_news_use_case.dart'
    as _i629;
import 'package:akhbarna/features/layout/category/domain/use_case/get_matches_use_case.dart'
    as _i902;
import 'package:akhbarna/features/layout/category/domain/use_case/search_category_articles_use_case.dart'
    as _i394;
import 'package:akhbarna/features/layout/category/presentation/cubit/category_news_cubit.dart'
    as _i462;
import 'package:akhbarna/features/layout/category/presentation/cubit/category_search_cubit.dart'
    as _i989;
import 'package:akhbarna/features/layout/category/presentation/cubit/matches_cubit.dart'
    as _i766;
import 'package:akhbarna/features/layout/home/data/data_sources/remote/home_api_remote_data_source.dart'
    as _i130;
import 'package:akhbarna/features/layout/home/data/data_sources/remote/home_remote_data_source.dart'
    as _i29;
import 'package:akhbarna/features/layout/home/data/data_sources/remote/weather_api_remote_data_source.dart'
    as _i1054;
import 'package:akhbarna/features/layout/home/data/data_sources/remote/weather_remote_data_source.dart'
    as _i660;
import 'package:akhbarna/features/layout/home/data/repositories_impl/home_repository_impl.dart'
    as _i478;
import 'package:akhbarna/features/layout/home/data/repositories_impl/weather_repository_impl.dart'
    as _i658;
import 'package:akhbarna/features/layout/home/domain/repositories/home_repository.dart'
    as _i466;
import 'package:akhbarna/features/layout/home/domain/repositories/weather_repository.dart'
    as _i661;
import 'package:akhbarna/features/layout/home/domain/use_case/get_breaking_news_use_case.dart'
    as _i898;
import 'package:akhbarna/features/layout/home/domain/use_case/get_current_weather_use_case.dart'
    as _i25;
import 'package:akhbarna/features/layout/home/domain/use_case/get_latest_news_use_case.dart'
    as _i393;
import 'package:akhbarna/features/layout/home/domain/use_case/get_most_read_news_use_case.dart'
    as _i537;
import 'package:akhbarna/features/layout/home/domain/use_case/get_search_articles_use_case.dart'
    as _i80;
import 'package:akhbarna/features/layout/home/domain/use_case/get_trending_news_use_case.dart'
    as _i386;
import 'package:akhbarna/features/layout/home/presentation/cubit/breaking_news_cubit.dart'
    as _i862;
import 'package:akhbarna/features/layout/home/presentation/cubit/latest_news_cubit.dart'
    as _i676;
import 'package:akhbarna/features/layout/home/presentation/cubit/most_read_news_cubit.dart'
    as _i487;
import 'package:akhbarna/features/layout/home/presentation/cubit/search_article_cubit.dart'
    as _i358;
import 'package:akhbarna/features/layout/home/presentation/cubit/trending_news_cubit.dart'
    as _i913;
import 'package:akhbarna/features/layout/home/presentation/cubit/weather_cubit.dart'
    as _i733;
import 'package:akhbarna/features/layout/profile/data/data_sources/profile_api_remote_data_source.dart'
    as _i766;
import 'package:akhbarna/features/layout/profile/data/data_sources/profile_remote_data_source.dart'
    as _i198;
import 'package:akhbarna/features/layout/profile/data/repositories_impl/profile_repository_impl.dart'
    as _i464;
import 'package:akhbarna/features/layout/profile/domain/repositories/profile_repository.dart.dart'
    as _i780;
import 'package:akhbarna/features/layout/profile/domain/use_case/get_profile_use_case.dart'
    as _i282;
import 'package:akhbarna/features/layout/profile/domain/use_case/update_profile_use_case.dart'
    as _i919;
import 'package:akhbarna/features/layout/profile/presentation/cubit/update_profile_cubit.dart'
    as _i101;
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
    gh.singleton<_i660.WeatherRemoteDataSource>(
      () => _i1054.WeatherApiRemoteDataSource(),
    );
    gh.singleton<_i318.ForgetPasswordRemoteDataSource>(
      () => _i26.ForgetPasswordApiRemoteDataSource(),
    );
    gh.singleton<_i29.HomeRemoteDataSource>(
      () => _i130.HomeApiRemoteDataSource(),
    );
    gh.singleton<_i661.WeatherRepository>(
      () => _i658.WeatherRepositoryImpl(
        remoteDataSource: gh<_i660.WeatherRemoteDataSource>(),
      ),
    );
    gh.singleton<_i402.LoginRemoteDataSource>(
      () => _i244.LoginApiRemoteDataSource(),
    );
    gh.singleton<_i505.MatchesRemoteDataSource>(
      () => _i596.MatchesApiRemoteDataSource(),
    );
    gh.singleton<_i512.RegisterRemoteDataSource>(
      () => _i757.RegisterApiRemoteDataSource(),
    );
    gh.factory<_i25.GetCurrentWeatherUseCase>(
      () => _i25.GetCurrentWeatherUseCase(
        repository: gh<_i661.WeatherRepository>(),
      ),
    );
    gh.singleton<_i692.CategoryRepository>(
      () => _i521.CategoryRepositoryImpl(
        remoteDataSource: gh<_i433.CategoryRemoteDataSource>(),
      ),
    );
    gh.singleton<_i539.SavedRemoteDataSource>(
      () => _i1007.SavedApiRemoteDataSource(
        authLocalDataSource: gh<_i1023.AuthLocalDataSource>(),
      ),
    );
    gh.singleton<_i198.ProfileRemoteDataSource>(
      () => _i766.ProfileApiRemoteDataSource(
        authLocalDataSource: gh<_i1023.AuthLocalDataSource>(),
      ),
    );
    gh.singleton<_i264.SavedLocalDataSource>(
      () => _i720.SavedLocalDataSourceImpl(
        authLocalDataSource: gh<_i1023.AuthLocalDataSource>(),
      ),
    );
    gh.singleton<_i235.ChangePasswordRemoteDataSource>(
      () => _i980.ChangePasswordApiRemoteDataSource(
        authLocalDataSource: gh<_i1023.AuthLocalDataSource>(),
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
    gh.factory<_i1062.BookMarketRepository>(
      () => _i526.BookMarketRepositoryImpl(
        localDataSource: gh<_i264.SavedLocalDataSource>(),
      ),
    );
    gh.singleton<_i1065.MatchesRepository>(
      () => _i753.MatchesRepositoryImpl(
        remoteDataSource: gh<_i505.MatchesRemoteDataSource>(),
      ),
    );
    gh.factory<_i629.GetCategoryNewsUseCase>(
      () => _i629.GetCategoryNewsUseCase(
        repository: gh<_i692.CategoryRepository>(),
      ),
    );
    gh.factory<_i394.SearchCategoryArticlesUseCase>(
      () => _i394.SearchCategoryArticlesUseCase(
        repository: gh<_i692.CategoryRepository>(),
      ),
    );
    gh.lazySingleton<_i989.CategorySearchCubit>(
      () => _i989.CategorySearchCubit(
        searchCategoryArticlesUseCase:
            gh<_i394.SearchCategoryArticlesUseCase>(),
      ),
    );
    gh.singleton<_i412.ChangePasswordRepository>(
      () => _i412.ChangePasswordRepositoryImpl(
        remoteDataSource: gh<_i235.ChangePasswordRemoteDataSource>(),
      ),
    );
    gh.singleton<_i780.ProfileRepository>(
      () => _i464.ProfileRepositoryImpl(
        remoteDataSource: gh<_i198.ProfileRemoteDataSource>(),
      ),
    );
    gh.factory<_i98.GetSavedArticlesUseCase>(
      () => _i98.GetSavedArticlesUseCase(
        repository: gh<_i1062.BookMarketRepository>(),
      ),
    );
    gh.factory<_i911.IsSavedArticleUseCase>(
      () => _i911.IsSavedArticleUseCase(
        repository: gh<_i1062.BookMarketRepository>(),
      ),
    );
    gh.factory<_i222.RemoveAllArticlesUseCase>(
      () => _i222.RemoveAllArticlesUseCase(
        repository: gh<_i1062.BookMarketRepository>(),
      ),
    );
    gh.factory<_i815.RemoveArticleUseCase>(
      () => _i815.RemoveArticleUseCase(
        repository: gh<_i1062.BookMarketRepository>(),
      ),
    );
    gh.factory<_i939.SaveArticleUseCase>(
      () => _i939.SaveArticleUseCase(
        repository: gh<_i1062.BookMarketRepository>(),
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
    gh.lazySingleton<_i733.WeatherCubit>(
      () => _i733.WeatherCubit(
        getCurrentWeatherUseCase: gh<_i25.GetCurrentWeatherUseCase>(),
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
    gh.factory<_i80.SearchArticlesUseCase>(
      () => _i80.SearchArticlesUseCase(repository: gh<_i466.HomeRepository>()),
    );
    gh.factory<_i386.GetTrendingNewsUseCase>(
      () =>
          _i386.GetTrendingNewsUseCase(repository: gh<_i466.HomeRepository>()),
    );
    gh.factory<_i39.ResetPasswordUseCase>(
      () => _i39.ResetPasswordUseCase(gh<_i975.ForgetPasswordRepository>()),
    );
    gh.factory<_i343.SendOtpUseCase>(
      () => _i343.SendOtpUseCase(gh<_i975.ForgetPasswordRepository>()),
    );
    gh.factory<_i56.VerifyOtpUseCase>(
      () => _i56.VerifyOtpUseCase(gh<_i975.ForgetPasswordRepository>()),
    );
    gh.lazySingleton<_i462.CategoryNewsCubit>(
      () => _i462.CategoryNewsCubit(
        getCategoryNewsUseCase: gh<_i629.GetCategoryNewsUseCase>(),
      ),
    );
    gh.factory<_i902.GetMatchesUseCase>(
      () => _i902.GetMatchesUseCase(repository: gh<_i1065.MatchesRepository>()),
    );
    gh.lazySingleton<_i862.BreakingNewsCubit>(
      () => _i862.BreakingNewsCubit(
        getBreakingNewsUseCase: gh<_i898.GetBreakingNewsUseCase>(),
      ),
    );
    gh.lazySingleton<_i487.MostReadNewsCubit>(
      () => _i487.MostReadNewsCubit(
        getMostReadNewsUseCase: gh<_i537.GetMostReadNewsUseCase>(),
      ),
    );
    gh.lazySingleton<_i766.MatchesCubit>(
      () =>
          _i766.MatchesCubit(getMatchesUseCase: gh<_i902.GetMatchesUseCase>()),
    );
    gh.factory<_i473.ChangePasswordUseCase>(
      () => _i473.ChangePasswordUseCase(
        repository: gh<_i412.ChangePasswordRepository>(),
      ),
    );
    gh.lazySingleton<_i676.LatestNewsCubit>(
      () => _i676.LatestNewsCubit(
        getLatestNewsUseCase: gh<_i393.GetLatestNewsUseCase>(),
      ),
    );
    gh.lazySingleton<_i913.TrendingNewsCubit>(
      () => _i913.TrendingNewsCubit(
        getTrendingNewsUseCase: gh<_i386.GetTrendingNewsUseCase>(),
      ),
    );
    gh.factory<_i282.GetProfileUseCase>(
      () => _i282.GetProfileUseCase(repository: gh<_i780.ProfileRepository>()),
    );
    gh.factory<_i919.UpdateProfileUseCase>(
      () =>
          _i919.UpdateProfileUseCase(repository: gh<_i780.ProfileRepository>()),
    );
    gh.factory<_i201.BookMarketCubit>(
      () => _i201.BookMarketCubit(
        removeAllArticlesUseCase: gh<_i222.RemoveAllArticlesUseCase>(),
        saveArticleUseCase: gh<_i939.SaveArticleUseCase>(),
        removeArticleUseCase: gh<_i815.RemoveArticleUseCase>(),
        getSavedArticlesUseCase: gh<_i98.GetSavedArticlesUseCase>(),
        isSavedArticleUseCase: gh<_i911.IsSavedArticleUseCase>(),
      ),
    );
    gh.factory<_i281.LoginCubit>(
      () => _i281.LoginCubit(loginUseCase: gh<_i766.LoginUseCase>()),
    );
    gh.lazySingleton<_i37.ChangePasswordCubit>(
      () => _i37.ChangePasswordCubit(
        changePasswordUseCase: gh<_i473.ChangePasswordUseCase>(),
      ),
    );
    gh.lazySingleton<_i358.SearchCubit>(
      () => _i358.SearchCubit(
        searchArticlesUseCase: gh<_i80.SearchArticlesUseCase>(),
      ),
    );
    gh.factory<_i739.ForgetPasswordCubit>(
      () => _i739.ForgetPasswordCubit(
        resetPasswordUseCase: gh<_i39.ResetPasswordUseCase>(),
        sendOtpUseCase: gh<_i343.SendOtpUseCase>(),
        verifyOtpUseCase: gh<_i56.VerifyOtpUseCase>(),
      ),
    );
    gh.lazySingleton<_i101.UpdateProfileCubit>(
      () => _i101.UpdateProfileCubit(
        updateProfileUseCase: gh<_i919.UpdateProfileUseCase>(),
        getProfileUseCase: gh<_i282.GetProfileUseCase>(),
      ),
    );
    return this;
  }
}

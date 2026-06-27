import 'package:akhbarna/features/layout/category/presentation/cubit/matches_cubit.dart';
import 'package:akhbarna/features/layout/home/presentation/cubit/breaking_news_cubit.dart';
import 'package:akhbarna/features/layout/home/presentation/cubit/trending_news_cubit.dart';
import 'package:akhbarna/features/layout/profile/presentation/cubit/update_profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import '../../core/di/service_locator.dart';
import '../../features/auth/forget_password/presentation/cubit/change_password_cubit.dart';
import '../../features/auth/login/presentation/cubit/login_cubit.dart';
import '../../features/auth/register/presentation/cubit/register_cubit.dart';
import '../../features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import '../../features/layout/bookMarket/presentation/cubit/save_article_cubit.dart';
import '../../features/layout/category/presentation/cubit/category_news_cubit.dart';
import '../../features/layout/category/presentation/cubit/category_search_cubit.dart';
import '../../features/layout/home/presentation/cubit/latest_news_cubit.dart';
import '../../features/layout/home/presentation/cubit/most_read_news_cubit.dart';
import '../../features/layout/home/presentation/cubit/search_article_cubit.dart';
import '../../features/layout/home/presentation/cubit/weather_cubit.dart';

class AppBlocProviders {
  static List<SingleChildWidget> providers = [
    BlocProvider(create: (_) => serviceLocator.get<RegisterCubit>()),
    BlocProvider(create: (_) => serviceLocator.get<LoginCubit>()),
    BlocProvider(create: (_) => serviceLocator.get<ForgetPasswordCubit>()),
    BlocProvider(create: (_) => serviceLocator.get<BreakingNewsCubit>()),
    BlocProvider(create: (_) => serviceLocator.get<MostReadNewsCubit>()),
    BlocProvider(create: (_) => serviceLocator.get<LatestNewsCubit>()),
    BlocProvider(create: (_) => serviceLocator.get<CategoryNewsCubit>()),
    BlocProvider(create: (_) => serviceLocator.get<TrendingNewsCubit>()),
    BlocProvider(create: (_) => serviceLocator.get<WeatherCubit>()),
    BlocProvider(create: (_) => serviceLocator.get<MatchesCubit>()),
    BlocProvider(create: (_) => serviceLocator.get<SearchCubit>()),
    BlocProvider(create: (_) => serviceLocator.get<BookMarketCubit>()),
    BlocProvider(create: (_) => serviceLocator.get<CategorySearchCubit>()),
    BlocProvider(create: (_) => serviceLocator.get<ChangePasswordCubit>()),
    BlocProvider(create: (_) => serviceLocator.get<UpdateProfileCubit>()),
  ];
}

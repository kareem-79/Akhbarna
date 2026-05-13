import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/features/auth/login/data/data_sources/remote/login_api_remote_data_source.dart';
import 'package:akhbarna/features/auth/login/data/repositories_impl/login_repository_impl.dart';
import 'package:akhbarna/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:akhbarna/features/auth/register/data/data_sources/remote/register_api_remote_data_source.dart';
import 'package:akhbarna/features/auth/register/data/repositories_impl/register_repository_impl.dart';
import 'package:akhbarna/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:akhbarna/provider/book_market_provider.dart';
import 'package:akhbarna/provider/config_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'config/Theme/theme_manager.dart';
import 'core/prefs_manager/prefs_manager.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PrefsManager.init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final configProvider = ConfigProvider();
  await configProvider.loadSavedSettings();

  runApp(
    MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => RegisterCubit(
            registerRepository: RegisterRepositoryImpl(
              registerApiRemoteDataSource: RegisterApiRemoteDataSource(),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => LoginCubit(
            loginRepository: LoginRepositoryImpl(
              loginApiRemoteDataSource: LoginApiRemoteDataSource(),
            ),
          ),
        ),
        ChangeNotifierProvider.value(value: configProvider),

        ChangeNotifierProvider(create: (_) => BookmarkProvider()),
      ],

      child: const Akhbarna(),
    ),
  );
}

class Akhbarna extends StatelessWidget {
  const Akhbarna({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(393, 852),
      splitScreenMode: true,
      builder: (context, child) {
        return Consumer<ConfigProvider>(
          builder: (context, configProvider, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: configProvider.currentLocale,
              theme: ThemeManager.light,
              darkTheme: ThemeManager.dark,
              themeMode: configProvider.currentTheme,

              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: configProvider.isSystemFont
                        ? MediaQuery.textScalerOf(context)
                        : TextScaler.linear(configProvider.textScaleFactor),
                  ),
                  child: child!,
                );
              },
              onGenerateRoute: RoutesManager.routes,
              initialRoute: RoutesManager.splash,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('ar'),
                Locale('fr'),
                Locale('de'),
                Locale('it'),
                Locale('es'),
                Locale('zh'),
                Locale('ja'),
                Locale('ru'),
                Locale('pt'),
                Locale('hi'),
                Locale('ko'),
                Locale('nl'),
                Locale('sv'),
                Locale('tr'),
              ],
            );
          },
        );
      },
    );
  }
}

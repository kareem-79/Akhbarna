import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/widget/my_scroll_behavior.dart';
import 'package:akhbarna/provider/config_provider.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'config/Theme/theme_manager.dart';
import 'core/di/service_locator.dart';
import 'core/prefs_manager/prefs_manager.dart';
import 'core/resources/app_bloc_providers.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PrefsManager.init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final configProvider = ConfigProvider();
  await configProvider.loadSavedSettings();
  setup();
  runApp(
    MultiProvider(
      providers: [
        ...AppBlocProviders.providers,
        ChangeNotifierProvider.value(value: configProvider),
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
            Color cardColor = Theme
                .of(context)
                .cardColor;
            return SkeletonizerConfig(
              data: SkeletonizerConfigData(
                effect: ShimmerEffect(
                  duration: Duration(milliseconds: 1000),
                  baseColor: cardColor,
                  highlightColor: ColorsManagers.gray2,
                ),
              ),
              child: ThemeProvider(
                initTheme: configProvider.currentTheme == ThemeMode.dark
                    ? ThemeManager.dark
                    : ThemeManager.light,
                child: ThemeSwitchingArea(
                  child: MaterialApp(
                    scrollBehavior: MyScrollBehavior(),
                    debugShowCheckedModeBanner: false,
                    locale: configProvider.currentLocale,
                    theme: ThemeManager.light,
                    darkTheme: ThemeManager.dark,
                    themeMode: configProvider.currentTheme,
                    themeAnimationDuration: const Duration(milliseconds: 700),
                    themeAnimationCurve: Curves.easeInOutCubic,
                    builder: (context, child) {
                      return MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                          textScaler: configProvider.isSystemFont
                              ? MediaQuery.textScalerOf(context)
                              : TextScaler.linear(
                              configProvider.textScaleFactor),
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
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

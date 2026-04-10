import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/provider/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'config/Theme/theme_manager.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const Akhbarna());
}

class Akhbarna extends StatelessWidget {
  const Akhbarna({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(393, 852),
      splitScreenMode: true,
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider<ConfigProvider>(
            create: (_) => ConfigProvider(),
          ),
        ],
        child: Consumer<ConfigProvider>(
          builder: (context, configProvider, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: const Locale('ar'),
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
              initialRoute: RoutesManager.mainLayout,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [Locale('en'), Locale('ar')],
            );
          },
        ),
      ),
    );
  }
}
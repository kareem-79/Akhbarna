import 'package:akhbarna/features/on_boarding/presentation/screens/on_boarding.dart';
import 'package:flutter/material.dart';

import '../../features/layout/main_layout.dart';
import '../../features/splash_screen/presentation/screens/splash_screen.dart';

class RoutesManager {
  static const String splash = "Splash";
  static const String onBoarding = "OnBoarding";
  static const String mainLayout = "MainLayout";

  static Map<String, WidgetBuilder> routes = {
    splash: (_) => SplashScreen(),
    onBoarding: (_) => OnBoardingScreen(),
    mainLayout: (_) => MainLayout(),
  };
}

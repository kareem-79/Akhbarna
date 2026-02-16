

import 'package:flutter/material.dart';

import '../../features/layout/main_layout.dart';
import '../../features/splash_screen/splash_screen.dart';

class RoutesManager{
  static const String splash="Splash";
  static const String onBoarding="OnBoarding";
  static const String mainLayout="MainLayout";

  static Map<String,WidgetBuilder> routes={
    splash:(_)=>SplashScreen(),
    mainLayout:(_)=>MainLayout(),

  };
}
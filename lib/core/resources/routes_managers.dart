import 'package:akhbarna/features/on_boarding/presentation/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import '../../features/auth/login/presentation/screens/login_screen.dart';
import '../../features/auth/register/presentation/screens/register_screen.dart';
import '../../features/auth/start_up/presentation/screens/start_up_screen.dart';
import '../../features/layout/main_layout.dart';
import '../../features/splash_screen/presentation/screens/splash_screen.dart';

class RoutesManager {
  static const String splash = "Splash";
  static const String startUp = "/startUp";
  static const String register = "/register";
  static const String login = "/Login";
  static const String onBoarding = "OnBoarding";
  static const String mainLayout = "MainLayout";

  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case onBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case startUp:
        return MaterialPageRoute(builder: (_) => StartUpScreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case mainLayout:
        return MaterialPageRoute(builder: (_) => MainLayout());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}

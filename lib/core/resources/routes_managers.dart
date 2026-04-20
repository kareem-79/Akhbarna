import 'package:akhbarna/features/layout/profile/presentation/screens/security/presentation/security_screen.dart';
import 'package:akhbarna/features/on_boarding/presentation/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import '../../features/auth/forget_password/presentation/screens/change_password.dart';
import '../../features/auth/forget_password/presentation/screens/forget_password.dart';
import '../../features/auth/forget_password/presentation/screens/login_with_OTP.dart';
import '../../features/auth/login/presentation/screens/login_screen.dart';
import '../../features/auth/register/presentation/screens/register_screen.dart';
import '../../features/auth/start_up/presentation/screens/start_up_screen.dart';
import '../../features/layout/main_layout.dart';
import '../../features/layout/profile/presentation/screens/about/presentation/about_screen.dart';
import '../../features/layout/profile/presentation/screens/profile_tab.dart';
import '../../features/layout/profile/presentation/screens/ِaccount_information/presentation/edit_profile_screen.dart';
import '../../features/setup/category_select/presentation/screens/select_category.dart';
import '../../features/setup/language_select/presentation/screens/select_language.dart';
import '../../features/setup/locations_select/presentation/screens/select_location.dart';
import '../../features/setup/sources_select/presentation/screens/select_sources.dart';
import '../../features/setup/start/presentation/screens/start_screen.dart';
import '../../features/splash_screen/presentation/screens/splash_screen.dart';

class RoutesManager {
  static const String splash = "Splash";
  static const String startUp = "/startUp";
  static const String register = "/register";
  static const String login = "/Login";
  static const String onBoarding = "OnBoarding";
  static const String forgetPassword = "ForgetPassword";
  static const String loginWithOtp = "LoginWithOtp";
  static const String changePassword = "ChangePassword";
  static const String selectLocation = "SelectLocation";
  static const String selectCategory = "SelectCategory";
  static const String selectLanguage = "SelectLanguage";
  static const String selectSources = "SelectSources";
  static const String start = "Start";
  static const String mainLayout = "MainLayout";
  static const String profile = "ProfileTab";
  static const String editProfile = "EditProfile";
  static const String security = "Security";
  static const String aboutUs = "AboutUs";

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
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPassword());
      case loginWithOtp:
        return MaterialPageRoute(builder: (_) => LoginWithOtp());
      case changePassword:
        return MaterialPageRoute(builder: (_) => ChangePassword());
      case selectLocation:
        return MaterialPageRoute(builder: (_) => SelectLocation());
      case selectCategory:
        return MaterialPageRoute(builder: (_) => SelectCategory());
      case selectLanguage:
        final bool isFromEdit = settings.arguments as bool? ?? false;
        return MaterialPageRoute(
          builder: (_) => SelectLanguage(isFromEdit: isFromEdit),
        );
      case selectSources:
        final bool isFromEdit = settings.arguments as bool? ?? false;
        return MaterialPageRoute(
          builder: (_) => SelectSources(isFromEdit: isFromEdit),
        );
      case start:
        return MaterialPageRoute(builder: (_) => StartScreen());
      case mainLayout:
        return MaterialPageRoute(builder: (_) => MainLayout());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfileTab());
      case editProfile:
        return MaterialPageRoute(builder: (_) => EditProfile());
      case security:
        return MaterialPageRoute(builder: (_) => SecurityScreen());
      case aboutUs:
        return MaterialPageRoute(builder: (_) => AboutUsScreen());
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

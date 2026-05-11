import 'package:akhbarna/features/layout/home/presentation/screens/notification_screen.dart';
import 'package:akhbarna/features/layout/profile/presentation/screens/security/presentation/security_screen.dart';
import 'package:akhbarna/features/on_boarding/presentation/screens/on_boarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../features/auth/forget_password/presentation/screens/change_password.dart';
import '../../features/auth/forget_password/presentation/screens/forget_password.dart';
import '../../features/auth/forget_password/presentation/screens/login_with_OTP.dart';
import '../../features/auth/login/presentation/screens/login_screen.dart';
import '../../features/auth/register/presentation/screens/register_screen.dart';
import '../../features/auth/start_up/presentation/screens/start_up_screen.dart';
import '../../features/layout/home/presentation/screens/most_read_Screen.dart';
import '../../features/layout/home/presentation/screens/top_news_screen.dart';
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
  static const String notification = "Notification";
  static const String topNews = "TopNews";
  static const String mostRead = "MostRead";

  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return CupertinoPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case onBoarding:
        return CupertinoPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case startUp:
        return CupertinoPageRoute(
          builder: (_) => const StartUpScreen(),
        );

      case register:
        return CupertinoPageRoute(
          builder: (_) => const RegisterScreen(),
        );

      case login:
        return CupertinoPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case forgetPassword:
        return CupertinoPageRoute(
          builder: (_) => const ForgetPassword(),
        );

      case loginWithOtp:
        return CupertinoPageRoute(
          builder: (_) => const LoginWithOtp(),
        );

      case changePassword:
        return CupertinoPageRoute(
          builder: (_) => const ChangePassword(),
        );

      case selectLocation:
        return CupertinoPageRoute(
          builder: (_) => const SelectLocation(),
        );

      case selectCategory:
        return CupertinoPageRoute(
          builder: (_) => const SelectCategory(),
        );

      case selectLanguage:
        final bool isFromEdit = settings.arguments as bool? ?? false;

        return CupertinoPageRoute(
          builder: (_) => SelectLanguage(
            isFromEdit: isFromEdit,
          ),
        );

      case selectSources:
        final bool isFromEdit = settings.arguments as bool? ?? false;

        return CupertinoPageRoute(
          builder: (_) => SelectSources(
            isFromEdit: isFromEdit,
          ),
        );

      case start:
        return CupertinoPageRoute(
          builder: (_) => const StartScreen(),
        );

      case mainLayout:
        return CupertinoPageRoute(
          builder: (_) => const MainLayout(),
        );

      case profile:
        return CupertinoPageRoute(
          builder: (_) => const ProfileTab(),
        );

      case editProfile:
        return CupertinoPageRoute(
          builder: (_) => const EditProfile(),
        );

      case security:
        return CupertinoPageRoute(
          builder: (_) => const SecurityScreen(),
        );

      case aboutUs:
        return CupertinoPageRoute(
          builder: (_) => const AboutUsScreen(),
        );

      case notification:
        return CupertinoPageRoute(
          builder: (_) => const NotificationScreen(),
        );

      case topNews:
        return CupertinoPageRoute(
          builder: (_) => const TopNewsScreen(),
        );

      case mostRead:
        return CupertinoPageRoute(
          builder: (_) => const MostReadScreen(),
        );

      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('No Route Found'),
            ),
            body: const Center(
              child: Text('No Route Found'),
            ),
          ),
        );
    }
  }
}